# frozen_string_literal: true

module Hecms
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
    extend KeywordLikeHelper
  end
end
