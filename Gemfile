# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '3.1.2'

# Rails
gem 'bootsnap', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.6'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Asset Pipeline and JavaScript
gem 'importmap-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# Front End
gem 'autoprefixer-rails'
gem 'bootstrap', '~> 5.2'
gem 'faker'
gem 'font-awesome-sass', '~> 6.1'
gem 'kaminari' # For pagination
gem 'sassc-rails' # Use Sass to process CSS
gem 'simple_form' # Form helper that generates forms with Bootstrap classes

# Miscellaneous
gem 'devise' # Authentication
gem 'octokit', '~> 5.0' # Wrapper for the GitHub API
gem 'pg_search'
gem 'sidekiq'
gem 'sidekiq-failures'

# Development and Testing Tools
group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console' # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-performance', '~> 1.18'
end

# Test Framework and Utilities
group :test do
  gem 'capybara' # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Uncomment if needed:
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'
