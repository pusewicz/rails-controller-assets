require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)
require 'rails_controller_assets'

module Dummy
  class Application < Rails::Application
    config.assets.digest = false
  end
end

