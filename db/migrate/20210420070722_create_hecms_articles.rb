# frozen_string_literal: true

class CreateHecmsArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :hecms_articles do |t|
      t.string(:title, null: false, comment: '标题')
      t.string(:seo_title, comment: 'SEO标题')
      t.string(:keywords, comment: '关键词')
      t.text(:description, comment: '简介')
      t.text(:content_html, comment: '内容')
      t.integer(:sort, comment: '排序')
      t.boolean(:top, comment: '置顶/热门')
      t.string(:slug)
      t.integer(:views, default: 0)
      t.datetime(:published_date)
      t.integer(:editer_id)
      t.datetime(:deleted_at, index: true)
      t.timestamps
    end
    add_index(:hecms_articles, :top)
    add_index(:hecms_articles, :slug, unique: true)
  end
end
