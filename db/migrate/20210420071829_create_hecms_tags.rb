# frozen_string_literal: true

class CreateHecmsTags < ActiveRecord::Migration[6.1]
  def change
    create_table :hecms_tags do |t|
      t.string :name, comment: '标签名'
      t.string :seo_title, comment: 'SEO标题'
      t.string :keywords, comment: '关键词'
      t.text :description, comment: '简介'
      t.string :slug
      t.timestamps
    end
    add_index :hecms_tags, :slug, unique: true
  end
end
