# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fff
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.template_engine :haml
      g.test_framework  :rspec, fixture: false
      g.view_specs      false
      g.helper_specs    false
      g.assets = false
      g.helper = false
      g.fixture_replacement :fabrication
    end
    config.before_configuration do
      ::FACEBOOK_CONFIG = YAML.load_file("#{::Rails.root}/config/facebook.yml")
    end
  end
end
