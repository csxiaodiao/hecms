# frozen_string_literal: true

module Hecms
  class Engine < ::Rails::Engine
    isolate_namespace Hecms

    config.before_initialize do
      config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
      # config.i18n.available_locales << 'zh-CN'
      ActiveSupport.on_load(:active_record) { include Hecms::ApplicationHelper }
    end

    initializer 'hecms.assets.precompile', group: :all do |app|
      app.config.assets.precompile << 'hecms_manifest.js'
    end

    # initializer :append_migrations do |app|
    #   unless app.root.to_s.match(root.to_s)
    #     config.paths['db/migrate'].expanded.each do |expanded_path|
    #       app.config.paths['db/migrate'] << expanded_path
    #     end
    #   end
    # end
  end
end
