source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2  '

gem 'responders', '~> 2.0'  # set of Rails responders
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.3.18'
gem 'sqlite3', group: :test
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

gem 'asset_sync' # Synchronises Assets between Rails and S3

gem 'activeadmin', github: 'gregbell/active_admin'  # administration framework

gem 'jquery-rails'  # Use jquery as the JavaScript library

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'  # authentication
gem 'twitter'  # sdk for twitter api

gem 'omniauth'  # authentication system for social signin
gem 'omniauth-oauth2'  # oauth 2 impl. for omniauth
gem 'omniauth-twitter'  # twitter provider impl. for omniauth
gem 'rmagick'  # an interface to the ImageMagick and GraphicsMagick

gem 'formtastic', '~> 3.0'
gem 'simple_form'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'unicorn'  # Use unicorn as the app server

group :development  do
	gem 'better_errors'  # Erros pages more expressive, less ugly

	gem 'capistrano', '~> 3.1.0'
	gem 'capistrano-rails', '~> 1.1.1'
	gem 'capistrano-bundler'
	gem 'capistrano-rvm'
	gem 'capistrano-rbenv', '~> 2.0'
end

group :development, :test do

	gem 'byebug'  # Debugging library
	gem 'quiet_assets'

	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring'
	gem 'figaro'  # makes app configuration using ENV and a single YAML file (config/application.yml)

	gem 'web-console'  # Access an IRB console on exception pages or by using <%= console %> inv views

end

# Use S3 AWS to store upload images
gem 'aws-sdk', '< 2.0'

# Use paperclip to manage images
gem 'paperclip', github: 'thoughtbot/paperclip', :branch => 'v4.3'

gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'
gem 'redis-rack-cache'

# API wrapper for MailChimp's API
gem 'gibbon', '2.1.0'

# library for create background jobs
gem 'resque', '~> 2.0.0.pre.1', github: 'resque/resque'