require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'bundler/setup'
require 'sinatra/flash'

set :database,"sqlite3:rasa.sqlite3"
set :sessions, true


get "/" do
  # @post = Post.find_by(title: 'Please').destroy
  erb :sign_in
end


post "/" do
  @user = User.where(fname: params[:user][:fname]).first

  if @user.password == params[:user][:password]
    session[:user_id] = @user.id

    flash[:notice] = "Welcome!"

    redirect "/feed"
  else
    flash[:notice] = "Your name and password do not match."

    redirect "/"
  end
end


get "/sign_up" do
  erb :sign_up
end


post "/sign_up" do
  @user = User.create(fname: params[:user][:fname],
  lname: params[:user][:lname],
  password: params[:user][:password])

  redirect "/feed"
  end


get "/feed" do
  @users = User.all
  @posts = Post.all
  erb :feed
end

post "/feed" do
  @post = Post.create(
    title: params[:post][:title], content: params[:post][:content], user_id: session[:user_id]
  )
  redirect "/feed"
end

get "/profile" do
  @users = User.all
  @posts = Post.all
  erb :profile
end

get '/sign-out' do
  session[:user_id] = nil
  redirect "/"
end

def current_user
  if session[:user_id]
   User.find(session[:user_id])
  end
end
