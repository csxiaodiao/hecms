# frozen_string_literal: true

class CreateHecmsCategoryRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :hecms_category_relations do |t|
      t.references :category, null: false, comment: '栏目'
      t.references :record, null: false, polymorphic: true, index: false
      t.timestamps
    end
    add_index :hecms_category_relations, %i[record_type record_id category_id], name: 'index_categories_uniqueness', unique: true
    add_foreign_key :hecms_category_relations, :hecms_categories, column: :category_id
  end
end
