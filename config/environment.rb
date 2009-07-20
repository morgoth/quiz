# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'haml'
  config.gem 'authlogic'
  config.gem 'state_machine'
  config.gem "mbleigh-acts-as-taggable-on", :lib => "acts-as-taggable-on"
  config.gem "justinfrench-formtastic", :lib => 'formtastic'
  config.gem 'ryanb-acts-as-list', :lib => 'acts_as_list'
  config.gem 'prawn'

  config.time_zone = 'Warsaw'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
end