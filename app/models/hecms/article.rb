# frozen_string_literal: true

module Hecms
  class Article < ApplicationRecord
    include SoftDelete
    extend Enumerize

    has_one_attached :image

    has_many :category_relations, as: :record, inverse_of: :record
    has_many :categories, through: :category_relations, class_name: 'Category'

    has_many :tag_relations, as: :record, inverse_of: :record
    has_many :tags, through: :tag_relations

    accepts_nested_attributes_for :category_relations, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :tag_relations, reject_if: :all_blank, allow_destroy: true

    scope_keyword_like hecms_articles: [:title]

    EDITERS = { editer1: 1, editer2: 2, editer3: 3, editer4: 4, editer5: 5 }.freeze

    enumerize :editer_id, in: EDITERS, default: :editer1, i18n_scope: 'activerecord.attributes.article/editer_id'

    def category_names
      categories.map(&:name).join(' ')
    end

    def tag_names
      tags.map(&:name).join(' ')
    end

    def display_created_at_date
      I18n.l(created_at, format: '%Y-%m-%d %H:%M:%S')
    end

    def display_published_date
      I18n.l(published_date, format: '%Y-%m-%d %H:%M:%S')
    end
  end
end
