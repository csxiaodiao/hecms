# frozen_string_literal: true

require_dependency 'hecms/application_controller'

module Hecms
  class BaseController < ApplicationController
    layout 'layouts/hecms/application'
    before_action :authenticate_user!
  end
end
