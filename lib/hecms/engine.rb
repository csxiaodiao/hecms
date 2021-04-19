# frozen_string_literal: true

module Hecms
  class Engine < ::Rails::Engine
    isolate_namespace Hecms

    config.before_initialize do
      config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
      ActiveSupport.on_load(:active_record) { include Hecms::ApplicationHelper }
    end

    initializer 'hecms.assets.precompile', group: :all do |app|
      app.config.assets.precompile << 'hecms_manifest.js'
      # app.config.assets.precompile += %w[
      #   hecms/application.css
      #   hecms/style.css
      # ]
    end
  end
end
