source 'https://rubygems.org'

ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use postgresql as the database for Active Record
gem 'pg'

gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
#gem 'omniauth-linkedin'

gem 'cancan'

gem 'truncate_html'

gem 'carrierwave'
gem 'rmagick', '2.13.2',require: false
gem 'fog'

gem 'carmen-rails', '~> 1.0.0'
gem 'haml-rails'
gem 'globalize', '~> 4.0.2'
#gem 'acts_as_tree'
gem 'ancestry'

gem 'forem', :github => "radar/forem", :branch => "rails4"
gem 'will_paginate', '~> 3.0.5'

gem 'wysiwyg-rails'
gem 'font-awesome-rails'

gem 'i18n'

# Active Admin
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'polyamorous', github: 'activerecord-hackery/polyamorous'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'formtastic', github: 'justinfrench/formtastic'

gem 'simple_enum'


group :development, :test do
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'guard-rspec'

  gem 'capistrano', '~> 3.3.5'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano3-unicorn'
  gem 'mailcatcher'
  gem 'populator'
  gem 'faker'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'i18n-tasks'
  gem "spork-rails"
end


group :development do
  gem 'pry-rails'
  gem 'active_record-annotate', '~> 0.4'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'database_cleaner'
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
#gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# gem 'rails_12factor', group: :production
group :production do
  gem 'unicorn'
end
