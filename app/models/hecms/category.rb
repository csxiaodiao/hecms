# frozen_string_literal: true

module Hecms
  class Category < ApplicationRecord
    acts_as_nested_set
    include SoftDelete
    extend FriendlyId

    has_many :category_relations, dependent: :destroy
    has_many :articles, through: :category_relations, source: :record, source_type: 'Article'
    has_many :tags, through: :category_relations, source: :record, source_type: 'Tag'

    friendly_id :slug, use: :slugged

    def self.options_for_select
      options = []
      roots.each do |category|
        each_with_level(category.self_and_descendants) do |x, level|
          options << ["#{'-' * level} #{x.name}", x.id]
        end
      end
      options
    end
  end
end
