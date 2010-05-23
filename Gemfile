source "http://rubygems.org"

gem "rails", "2.3.6", :require => nil

gem "haml", ">= 3.0.5"
gem "compass", ">= 0.10"
gem "authlogic"
gem "state_machine"
gem "acts-as-list", :require => "acts_as_list"
gem "prawn"
gem "paperclip"
gem "routing-filter", :require => "routing_filter"
gem "acts-as-taggable-on"
gem "formtastic", ">=0.9.8"

gem "sqlite3-ruby", :require => "sqlite3", :group => [:development, :test, :cucumber]

group :production do
  gem "pg"
end

group :test do
  gem "test-unit", ">=2.0.7", :require => "test/unit"
  gem 'factory_girl'
  gem 'shoulda'
  gem 'rr'
end

group :cucumber do
  gem "cucumber"
  gem "cucumber-rails", :require => nil
  gem "database_cleaner", :require => nil
  gem "capybara", :require => nil
  gem "launchy", :require => nil
  gem "factory_girl", :require => nil
end
