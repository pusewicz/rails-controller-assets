require 'rails_controller_assets/precompiler'
require 'rails_controller_assets/controller_assets_helper'

module RailsControllerAssets
  # Rails engine definition class
  class Engine < ::Rails::Engine
    config.assets.precompile << Precompiler.new

    config.to_prepare do
      ApplicationController.helper(ControllerAssetsHelper)
    end
  end
end
