source "https://rubygems.org"
ruby '1.9.3'

gem 'sinatra'
gem 'sinatra-activerecord'
gem 'shotgun'
# gem 'bcrypt'

group :development do
  gem 'rspec'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'dotenv'
  gem 'sqlite3' # Remove this when deploying to Heroku
end

group :production do
  gem 'pg'
end

