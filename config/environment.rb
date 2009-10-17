# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'rack'
  config.gem 'haml'
  config.gem "compass" :source => "http://gemcutter.org"
  config.gem 'authlogic'
  config.gem 'state_machine'
  config.gem "mbleigh-acts-as-taggable-on", :lib => "acts-as-taggable-on", :source => "http://gems.github.com"
  config.gem "formtastic", :source => "http://gemcutter.org"
  config.gem 'acts-as-list', :lib => 'acts_as_list', :source => "http://gemcutter.org"
  config.gem 'prawn'
  config.gem 'paperclip', :source => "http://gemcutter.org"
  config.gem 'svenfuchs-routing-filter', :lib => 'routing_filter', :source => "http://gems.github.com"

  config.time_zone = 'Warsaw'

  config.i18n.load_path += Dir[File.join(Rails.root, "config", "locales", "**", "*.{rb,yml}")]
  config.i18n.default_locale = :pl
end