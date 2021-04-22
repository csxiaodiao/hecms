# frozen_string_literal: true

require_dependency 'hecms/application_controller'

module Hecms
  class BaseController < ApplicationController
    layout 'layouts/hecms/application'
    before_action :authenticate_user!

    set_current_tenant_through_filter
    before_action :set_tenant

    def set_tenant
      set_current_tenant(current_user)
    end
  end
end
