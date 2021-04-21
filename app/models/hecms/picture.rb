# frozen_string_literal: true

module Hecms
  class Picture < ApplicationRecord
    has_one_attached :image
  end
end
