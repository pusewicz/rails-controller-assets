module RailsControllerAssets::ControllerAssetsHelper
  def controller_stylesheets
    styles = []
    styles << controller_stylesheet if controller_stylesheet?
    styles << controller_and_action_stylesheet if controller_and_action_stylesheet?
    styles
  end

  def controller_and_action
    [controller_path, action_name].join('_')
  end

  def controller_stylesheet?
    controller_asset?(:css)
  end

  def controller_and_action_stylesheet?
    controller_and_action_asset?(:css)
  end

  def controller_javascripts
    scripts = []
    scripts << controller_javascript if controller_javascript?
    scripts << controller_and_action_javascript if controller_and_action_javascript?
    scripts
  end

  def controller_javascript?
    controller_asset?(:js)
  end

  def controller_and_action_javascript?
    controller_and_action_asset?(:js)
  end

  def controller_asset?(type)
    Rails.application.assets.find_asset(controller_asset(type))
  end

  def controller_and_action_asset?(type)
    Rails.application.assets.find_asset(controller_and_action_asset(type))
  end

  def controller_asset(type)
    "#{controller_path}.#{type}"
  end

  def controller_and_action_asset(type)
    "#{controller_and_action}.#{type}"
  end

  def controller_javascript
    controller_asset(:js)
  end

  def controller_and_action_javascript
    controller_and_action_asset(:js)
  end

  def controller_stylesheet
    controller_asset(:css)
  end

  def controller_and_action_stylesheet
    controller_and_action_asset(:css)
  end

  def skip_controller_stylesheet!
    stylesheet_bundles.delete(controller_stylesheet)
  end
end
