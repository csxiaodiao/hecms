# frozen_string_literal: true

module Hecms
  class Article < ApplicationRecord
    include SoftDelete
    extend Enumerize

    has_one_attached :image

    has_many :category_relations, as: :record, inverse_of: :record
    has_many :categories, through: :category_relations

    has_many :tag_relations, as: :record, inverse_of: :record
    has_many :tags, through: :tag_relations

    accepts_nested_attributes_for :category_relations, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :tag_relations, reject_if: :all_blank, allow_destroy: true

    scope_keyword_like hecms_articles: [:title]

    EDITERS = { editer1: 1, editer2: 2, editer3: 3, editer4: 4, editer5: 5 }.freeze

    enumerize :editer_id, in: EDITERS, default: :editer1, i18n_scope: 'activerecord.attributes.article/editer_id'
  end
end
