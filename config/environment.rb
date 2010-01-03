# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'haml'
  config.gem "compass"
  config.gem 'authlogic'
  config.gem 'state_machine'
  config.gem "acts-as-taggable-on"
  config.gem "formtastic"
  config.gem 'acts-as-list', :lib => 'acts_as_list'
  config.gem 'prawn'
  config.gem 'paperclip'
  config.gem 'routing-filter', :lib => 'routing_filter'

  config.time_zone = 'Warsaw'

  config.i18n.load_path += Dir[File.join(Rails.root, "config", "locales", "**", "*.{rb,yml}")]
  config.i18n.default_locale = :pl
end