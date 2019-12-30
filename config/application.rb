require_relative 'boot'

require 'rails/all'

require "sprockets/railtie"
# require "rails/test_unit/railtie"
require 'sprockets/es6'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StackRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

    config.assets.precompile = ["application.es6"]
    # config.assets.enabled = true
    config.assets.initialize_on_precompile = false
    config.i18n.default_locale = 'zh-CN'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
