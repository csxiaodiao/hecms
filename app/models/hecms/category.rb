# frozen_string_literal: true

module Hecms
  class Category < ApplicationRecord
    acts_as_nested_set
    extend FriendlyId

    friendly_id :slug, use: :slugged
  end
end
