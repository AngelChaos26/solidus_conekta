source 'https://rubygems.org'

gem 'solidus', github: 'solidusio/solidus'
# Provides basic authentication functionality for testing parts of your engine
gem 'solidus_auth_devise', '~> 1.0'

gem 'solidus_i18n', github: 'solidusio-contrib/solidus_i18n', branch: 'master'
gem 'solidus_globalize', github: 'solidusio-contrib/solidus_globalize', branch: 'master'

gem 'globalize', github: 'globalize/globalize', branch: 'master'

group :test, :development do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'sqlite3'
  gem 'factory_girl'
  gem 'pry'
  gem 'database_cleaner'
  gem 'spork'
  gem 'poltergeist'
  gem 'selenium-webdriver'
  gem 'capybara-webkit'
  gem 'capybara'
  gem 'vcr'
end

group :test do
  gem 'ffaker'
end

gemspec