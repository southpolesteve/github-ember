source 'https://rubygems.org'

ruby "2.0.0"

gem 'rails', '4.0.2'


gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'ember-rails', github: 'emberjs/ember-rails'
gem 'momentjs-rails'
gem 'haml-rails'
gem 'pry-rails'
gem 'omniauth'
gem 'omniauth-github'
gem 'figaro'
gem 'newrelic_rpm'
gem 'sentry-raven'
gem 'ember-source', '1.3.0.beta.3'

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'unicorn'
end

group :development, :test do
  gem 'thin'
  gem 'sqlite3'
end

group :development do
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
end
