source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Kludgy workaround because of mimemagic GPL doc weirdness.
gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.1.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 6.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.8'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.1.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'pg'
# group :assets do
#   gem 'sass-rails',   '~> 3.2.3'
#   gem 'coffee-rails', '~> 3.2.1'
#   gem 'uglifier', '>= 1.0.3'
# end
gem 'rolify'
# gem 'jquery-rails'
# gem 'thin', '>= 1.5.0'
# gem 'rspec-rails', '>= 2.12.2', :group => [:development, :test]
gem 'database_cleaner', '>= 0.9.1', :group => :test
gem 'email_spec', '>= 1.4.0', :group => :test
# gem 'cucumber-rails', '>= 1.3.0', :group => :test, :require => false
gem 'launchy', '>= 2.1.2', :group => :test
# gem 'capybara', '>= 2.0.2', :group => :test
# gem 'factory_girl_rails', '>= 4.2.0', :group => [:development, :test]
# gem 'bootstrap-sass', '>= 2.2.2.0'
gem 'devise'
gem 'authority'
gem 'simple_form', '>= 2.0.4'
# gem 'quiet_assets', '>= 1.0.1', :group => :development
gem 'figaro', '>= 0.5.3'
# gem 'better_errors', '>= 0.3.2', :group => :development
# gem 'binding_of_caller', '>= 0.6.8', :group => :development
