ActiveSupport::Inflector.inflections do |inflect|
  inflect.acronym 'OpenStax'
end

module OpenStax
  module OpenApi
    class Engine < ::Rails::Engine
      isolate_namespace OpenStax::OpenApi

      config.generators do |g|
        g.test_framework :rspec
      end
    end
  end
end
