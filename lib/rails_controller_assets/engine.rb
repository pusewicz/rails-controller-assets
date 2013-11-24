require 'rails_controller_assets/precompiler'
require 'rails_controller_assets/controller_assets_helper'

module RailsControllerAssets
  class Engine < ::Rails::Engine
    config.assets.precompile << RailsControllerAssets::Precompiler.new

    config.to_prepare do
      ApplicationController.helper(RailsControllerAssets::ControllerAssetsHelper)
    end
  end
end
