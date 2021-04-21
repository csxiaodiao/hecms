# frozen_string_literal: true

module Hecms
  class Tag < ApplicationRecord
    extend FriendlyId

    has_many :tag_relations

    accepts_nested_attributes_for :tag_relations, reject_if: :all_blank, allow_destroy: true

    friendly_id :slug, use: :slugged

    validates :name, presence: true

    scope_keyword_like hecms_tags: [:name]

    def self.options_for_select
      options = []
      all.each do |x|
        options << [x.name, x.id]
      end
      options
    end
  end
end
