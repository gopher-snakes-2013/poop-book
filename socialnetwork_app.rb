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

get '/' do

  erb :index
end

get "/user/:username" do
  @username = params[:username]
  "hello psycho"
  erb :user 
  #redirecting to a new erb with form on it vs. post page?
  #have post form directly on that page
end

get '/incorrect-login' do
  erb :incorrect
end

post '/signup' do
  # add code here to create new user in users table
  current_user = User.create!(username: params[:sign_up_user_name], password: params[:sign_up_password])
  puts current_user.username
  redirect "/user/#{current_user.username}"
end

post '/login' do
  current_user = User.find_by username: params[:login_user_name]
  if ! current_user.nil?
    if current_user.password == params[:login_password]
      redirect "/user/#{current_user.username}"
    else
      redirect '/incorrect-login'
    end
  else
    redirect '/incorrect-login'
  end
end

