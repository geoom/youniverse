source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.3.18'
# Use SCSS for stylesheets
gem 'sass'
gem 'sass-rails', '~> 5.0'
gem 'materialize-sass' # Materialize css framework
gem 'bower-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'figaro'  # makes app configuration using ENV and a single YAML file (config/application.yml)

gem 'aws-sdk'  # Use S3 AWS to store upload images

gem 'asset_sync', group: :assets  # Synchronises Assets between Rails and S3

gem 'activeadmin', github: 'gregbell/active_admin'  # administration framework

gem 'jquery-rails'  # Use jquery as the JavaScript library

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', group: :development
gem 'devise'  # authentication

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'unicorn'  # Use unicorn as the app server

group :development  do
	gem 'capistrano', '~> 3.1.0'
	gem 'capistrano-rails', '~> 1.1.1'
	gem 'capistrano-bundler'
	gem 'capistrano-rvm'
	gem 'capistrano-rbenv', '~> 2.0'
end

group :production do
	gem 'aws-sdk'  # Use S3 AWS to store upload images
end

# Use paperclip to manage images
gem 'paperclip', github: 'thoughtbot/paperclip', :branch => 'v3.5'

# Use debugger
# gem 'debugger', group: [:development, :test]
