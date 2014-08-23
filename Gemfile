source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'mysql2', '0.3.16'

gem 'haml-rails', '~> 0.5.3'
gem 'sass-rails', '~> 4.0.0'

gem 'uglifier', '~> 1.3.0' # javascript compressor 
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '~> 3.0.4'
gem 'jquery-ui-rails', '~> 5.0.0'

gem 'foundation-rails', '~> 5.3.0.1'

gem 'devise', '~> 3.2.4' # login authentication
gem 'paperclip', '~> 4.1' # attachments on models

# using master branch of git because rubygems version doesn't support rails 4
gem 'active_enum', github: 'adzap/active_enum', ref: '14fc08b0080c44f4d68611c9e63cd163d4586a12'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# gem 'unicorn'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', '~> 3.2.0'
  gem 'capistrano-rails', '~> 1.1'
end

gem 'byebug', group: [:development, :test]
