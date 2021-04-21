# frozen_string_literal: true

module AdsWordsable
  extend ActiveSupport::Concern

  class_methods do
    def ads_words
      YAML.load(File.read(Rails.root.join("lib/ads_words/ads_words.yml")))["ads_words"]
    end
  end
end
