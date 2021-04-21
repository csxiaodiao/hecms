# frozen_string_literal: true

json.articles do
  json.array! @articles do |x|
    json.id x.id
    json.title x.title
    json.category_names x.category_names
    json.tag_names x.tag_names
    json.content strip_tags(x.content_html.to_s)
  end
end
json.meta do
  json.total_pages @articles.total_pages
  json.total_count @articles.total_count
end
