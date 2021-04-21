# frozen_string_literal: true

class CreateHecmsTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :hecms_tag_relations do |t|
      t.references :tag, foreign_key: true, null: false, comment: '标签'
      t.references :record, null: false, polymorphic: true, index: false
      t.timestamps
    end
    add_index :hecms_tag_relations, %i[record_type record_id tag_id], name: 'index_tags_uniqueness', unique: true
  end
end
