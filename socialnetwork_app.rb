$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user'

begin
require 'dotenv'
Dotenv.load
rescue LoadError
end

set :database, ENV['DATABASE_URL']

get '/' do

  erb :index
end

post '/signup' do
  # add code here to create new user in users table
  redirect '/'
end