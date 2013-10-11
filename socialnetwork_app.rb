$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user'
require_relative 'models/post'

# require 'dotenv'
# Dotenv.load
#do foreman start in command line for locally doin shhheet
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
# when deploy

enable :sessions

post '/posts' do
  @logged_in_user = User.find(session["user_id"])
  @logged_in_user.posts << Post.create(:content => params["user_input"])
  redirect '/user/:username'
end

get '/' do
  erb :index
end

get "/user/:username" do
  @logged_in_user = User.find(session["user_id"])
  @posts = Post.where(user_id: @logged_in_user.id).reverse
  erb :user
end

get '/incorrect-login' do
  erb :incorrect
end

post '/signup' do
  current_user = User.create!(username: params[:sign_up_user_name], password: params[:sign_up_password])
  session["user_id"] = current_user.id
  redirect "/user/#{current_user.username}"
end

post '/login' do
  current_user = User.find_by username: params[:login_user_name]
  unless current_user.nil?
    if current_user.password == params[:login_password]
      session["user_id"] = current_user.id
      redirect "/user/#{current_user.username}"
    else
      redirect '/incorrect-login'
    end
  else
    redirect '/incorrect-login'
  end
end

