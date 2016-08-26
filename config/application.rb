require_relative 'boot'

require 'rails/all'
require 'neo4j/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Clinitrimax
  class Application < Rails::Application
    # Include Workers in autoload
    config.autoload_paths += %W(#{Rails.root}/app/workers)
    # Generate Neo4j models
    config.generators { |g| g.orm :neo4j }
  end
end
