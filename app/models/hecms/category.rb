# frozen_string_literal: true

module Hecms
  class Category < ApplicationRecord
    acts_as_nested_set
    include SoftDelete
    extend FriendlyId

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
