$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'rails_controller_assets/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails-controller-assets'
  s.version     = RailsControllerAssets::VERSION
  s.authors     = ['Piotr Usewicz']
  s.email       = ['piotr@layer22.com']
  s.homepage    = 'https://github.com/pusewicz/rails-controller-assets'
  s.summary     = 'Rails per controller assets'
  s.description = 'Precompiles bundles of assets per controller or controller/action pair.'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '>= 4.0', '< 4.2'
end
