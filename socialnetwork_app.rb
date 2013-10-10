$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user'
require_relative 'models/post'

require 'dotenv'
Dotenv.load


ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/social_network')

get '/posts' do
  @posts = Post.all.reverse
  erb :post
end

post '/posts' do
  Post.create(:content => params["user_input"])
  redirect '/posts'
end

