require "rails/railtie"
require "lograge"

module BetterLogging
  class Railtie < Rails::Railtie
    config.better_logging = ActiveSupport::OrderedOptions.new
    config.better_logging.enabled = ENV["BETTER_LOGGING"].present?
    if config.better_logging.enabled
      require "rails_12factor"

      config.lograge.enabled = true
      config.log_level = ENV.fetch("LOG_LEVEL") { "debug" }.to_sym
      config.action_controller.log_warning_on_csrf_failure = false
      config.lograge.enabled = true
      config.lograge.formatter = ->(payload) { JSON.dump(payload) }
      config.lograge.custom_options = ->(event) do
        {request_id: event.payload[:request_id]}
      end
    end

    initializer "better_logging.request_id" do
      ActiveSupport.on_load(:action_controller) do
        class_eval do
          def append_info_to_payload(payload)
            super
            payload[:request_id] = request.uuid
          end
        end
      end
    end
  end
end
