# frozen_string_literal: true

module Hecms
  class CategoryRelation < ApplicationRecord
    belongs_to :record, polymorphic: true, touch: true
    belongs_to :category
  end
end
