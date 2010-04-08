source "http://rubygems.org"

gem "rails", :require => nil

gem "haml"
gem "compass"
gem "authlogic"
gem "state_machine"
gem "acts-as-list", :require => "acts_as_list"
gem "prawn"
gem "paperclip"
gem "routing-filter", :require => "routing_filter"
gem "acts-as-taggable-on"
gem "formtastic", ">=0.9.8"

gem "sqlite3-ruby", :require => "sqlite3", :group => [:development, :test]

group :production do
  gem "pg"
end

group :test do
  gem "test-unit", ">=2.0.7", :require => "test/unit"
  gem 'factory_girl'
  gem 'cucumber', :require => nil
  gem 'cucumber-rails', :require => nil
  gem 'database_cleaner', :require => nil
  gem 'webrat', :require => nil
  gem 'shoulda'
  gem 'rr'
end
