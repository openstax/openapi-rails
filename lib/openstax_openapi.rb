require "openstax/openapi/engine"

module OpenStax
  module OpenApi

    def self.configure
      yield configuration
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.build_root_json(binding)
      Swagger::Blocks.build_root_json(binding)
    end

    class Configuration
      attr_accessor :client_language_configs
      attr_accessor :client_language_post_processing
      attr_accessor :json_proc
      attr_accessor :model_bindings_dir_proc
      attr_accessor :model_bindings_module_proc

      def initialize
        @client_language_configs = {}
        @client_language_post_processing = {}
        @model_bindings_dir_proc = -> (api_major_version) {
          "#{Rails.application.root}/app/bindings/api/v#{api_major_version}/bindings"
        }
        @model_bindings_module_proc = -> (api_major_version) {
          "Api::V#{api_major_version}::Bindings"
        }
      end
    end
  end
end

require "swagger/blocks"
require "openstax/openapi/record_extensions"
require "openstax/openapi/blocks"
require "openstax/openapi/bind"
