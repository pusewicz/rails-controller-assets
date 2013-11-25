module RailsControllerAssets
  class Precompiler
    def call(asset, filename)
      return false unless filename =~ /\/app\/assets/
      if include?(asset)
        puts "Including #{asset}"
        true
      else
        false
      end
    end

    def arity
      2
    end

    protected

    def controller_paths
      @controller_paths ||= find_controller_paths
    end

    def controller_actions
      @controller_actions ||= find_controller_actions
    end

    def include?(asset)
      return false unless asset =~ /\.(css|js)\z/
      return false if partial?(asset)

      controller_asset?(asset) || action_asset?(asset)
    end

    def partial?(asset)
      asset.split('/').last.start_with?('_')
    end

    def controller_asset?(asset)
      controller_paths.any? { |path| asset.include?(path) }
    end

    def action_asset?(asset)
      controller_actions.any? { |action| asset.include?(action) }
    end

    def controllers
      @eager_load  ||= Rails.application.eager_load!
      @controllers ||= ::ActionController::Base.descendants
    end

    def find_controller_actions
      controllers.map do |controller|
        controller.action_methods.map do |action|
          "#{controller.controller_path}_#{action}"
        end
      end.flatten
    end

    def find_controller_paths
      controllers.map do |controller|
        controller.controller_path
      end
    end
  end
end
