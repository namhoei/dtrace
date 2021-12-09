require_relative "boot"

require "rails/all"
require "dry/monads/all"
require "opencensus/trace/integrations/rails"
require "opencensus/trace/integrations/faraday_middleware"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mainapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    OpenCensus.configure do |c|
      c.trace.exporter = OpenCensus::Trace::Exporters::JaegerExporter.new(
        service_name: 'tracing mainapp',
        host: 'localhost', # default to 'localhost'
        port: '6831', # default to 6831
        tags: { 'tracing': 'mainapp' },
        max_packet_length: 8000, # config if you want something smaller than DEFAULT_MAX_LENGTH,
        protocol_class: ::Thrift::CompactProtocol # currently supporting only compact protocol
      )
    end
  end
end
