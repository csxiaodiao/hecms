# frozen_string_literal: true

require_dependency 'hecms/base_controller'

module Hecms
  class UploadsController < BaseController
    def create
      picture = Picture.new(image: params[:upload])
      if picture.save
        render(json: { url: picture.image.service_url })
      else
        render(json: {})
      end
    end
  end
end
