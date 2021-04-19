# frozen_string_literal: true

class CreateHecmsCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :hecms_categories do |t|
      t.string :name, null: false, comment: '栏目名'
      t.string :seo_title, comment: 'SEO标题'
      t.string :keywords, comment: '关键词'
      t.text :description, comment: '简介'
      t.string :slug, comment: 'uri标识'
      t.boolean :enabled, default: true

      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true

      # optional fields
      t.integer :depth, null: false, default: 0
      t.integer :children_count, null: false, default: 0
      t.datetime :deleted_at, index: true
      t.timestamps
    end
    add_index :hecms_categories, :slug, unique: true
  end
end
