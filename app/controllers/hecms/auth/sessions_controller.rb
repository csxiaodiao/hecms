# frozen_string_literal: true

module Hecms
  class Auth::SessionsController < Devise::SessionsController
    layout 'layouts/hecms/simple'

    private

    def after_sign_in_path_for(_resource)
      root_path
    end

    def after_sign_out_path_for(_scope)
      new_user_session_path
    end
  end
end
