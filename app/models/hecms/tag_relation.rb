# frozen_string_literal: true

module Hecms
  class TagRelation < ApplicationRecord
    belongs_to :record, polymorphic: true, touch: true
    belongs_to :tag, counter_cache: :articles_count
  end
end
