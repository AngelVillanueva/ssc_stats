source 'https://rubygems.org'

### BASIC FOUNDATION
ruby '2.1.0' #rvm gemset: ruby-2.1.0@ssc_stats
gem 'rails', '4.1.0'
gem 'thin', '~> 1.6.2'
gem 'pg', '~> 0.17'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

### TESTS
group :development, :test do
  gem 'spring-commands-rspec', '~> 1.0.2'
  gem 'rspec-rails', '~> 2.14.2'
  gem 'guard-rspec', '~> 4.2.8'
  gem 'rb-fsevent', '~> 0.9.4'
end
group :test do
  gem 'shoulda-matchers', '~> 2.6.0'
  gem 'selenium-webdriver', '2.41.0'
  gem 'capybara', '2.2.1'
end

### TOOLS
group :development do
  gem 'awesome_print', '~> 1.2.0'
  gem 'annotate', ">=2.6.0"
  gem 'better_errors', '~> 1.1.0' # cool error info pages in development. Trace last error also by navigating to 0.0.0.0:3000/__better_errors
  gem 'binding_of_caller', '~> 0.7.2' # cool error info pages in development
  gem 'meta_request', '~> 0.3.0' # rails_panel chrome extension.
  gem 'quiet_assets', '~> 1.0.2' # Get rid of loading assets info in development log
  gem 'ruby_gntp', '~> 0.3.4' # Growl with Bullet
  gem 'bullet', '~> 4.8.0' # Advise on n+1 queries
  gem 'lol_dba', '~> 1.6.0' # Advise on missing indexes
  #gem 'railroady' # SVG generator for models and associations
end

### HEROKU
gem 'rails_12factor', '0.0.2', group: :staging # needed for manage static assets in Heroku




# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby



# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

