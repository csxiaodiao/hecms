# frozen_string_literal: true

class CreateHecmsCategoryRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :hecms_category_relations do |t|
      t.references :category, foreign_key: true, null: false, comment: '栏目'
      t.references :record, null: false, polymorphic: true, index: false
      t.timestamps
    end
    add_index :hecms_category_relations, %i[record_type record_id category_id], name: 'index_categories_uniqueness', unique: true
  end
end
