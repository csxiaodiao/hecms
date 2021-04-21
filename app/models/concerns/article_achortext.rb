# frozen_string_literal: true

module ArticleAchortext
  extend ActiveSupport::Concern
  included do
    has_many :anchor_text_relations
    has_many :anchor_texts, through: :anchor_text_relations
    accepts_nested_attributes_for :anchor_text_relations, reject_if: :all_blank, allow_destroy: true
    after_commit :push_article_achortext_worker, on: [:create, :update]
  end

  def push_article_achortext_worker
    ArticleAchortextWorker.perform_async(id)
  end

  def builder_achortext
    @doc = Nokogiri::HTML(content_html)
    total_links = 0
    AnchorText.anchortext.each do |x|
      next unless @doc.content.include?(x[:anchortext])

      anchortext_relations = []
      links_per_pattern = 0

      @doc.search("p").children.each do |child|
        next unless analize_node(child, x)
        anchortext_relations << { anchor_text_id: x[:id] }

        links_per_pattern += 1
        total_links += 1
      end

      next if anchortext_relations.blank?

      begin
        anchor_text_relations.create!(anchortext_relations)
      rescue => e
        Rails.logger.info("anchor text relations error: #{e}")
      end
    end

    return if total_links == 0

    content_html = @doc.at("body").nil? ? "" : @doc.at("body").inner_html
    # skip after_commit
    update(content_html: content_html)
  end

  def remove_article_achortext_by_achortext(anchor_text)
    anchortext = anchor_text.name
    @doc = Nokogiri::HTML(content_html)

    @doc.search("a").each do |node|
      next unless node.children.count < 2
      replace_text = node.content
      if replace_text == anchortext
        node.replace(replace_text)
      end
    end
    content_html = @doc.at("body").nil? ? "" : @doc.at("body").inner_html
    # skip after_commit
    update(content_html: content_html)
  end

  private

  def analize_node(node, pattern)
    if %('text', 'strong').include?(node.name) && node.children.count < 2
      replace_text = node.content

      result = replace_text.sub!(/(#{pattern[:anchortext]})/i, pattern[:a_tag])

      unless result.nil?
        if node.name == "text"
          node.replace(replace_text)
        else
          new_node = @doc.create_element(node.name)
          new_node.inner_html = replace_text
          node.replace(new_node)
        end

        return true
      end
    end

    false
  end
end
