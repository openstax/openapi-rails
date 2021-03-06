$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "openstax/openapi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "openstax_openapi"
  spec.version     = OpenStax::OpenApi::VERSION
  spec.authors     = ["JP Slavinsky"]
  spec.email       = ["jpslav@gmail.com"]
  spec.homepage    = "https://github.com/openstax/openapi-rails"
  spec.summary     = "OpenStax-specific use of openapi-blocks for Rails projects"
  spec.description = "OpenStax-specific use of openapi-blocks for Rails projects"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.2.3", "< 8.0"
  spec.add_dependency "swagger-blocks", '~> 3.0.0'
  spec.add_dependency "oj"
  spec.add_dependency "oj_mimic_json"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "byebug"
end
