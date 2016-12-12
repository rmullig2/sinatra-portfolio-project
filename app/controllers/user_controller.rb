require './config/environment'

class UserController < ApplicationController
  
  get '/signup/?' do
    @failure_message = session[:fail] || @failure_message = ""
    #binding.pry
    erb :'/users/create'
  end
  
  post '/signup' do
    #binding.pry
    if params[:first_name].empty?
      session[:fail] = "Please specify first name"
      #binding.pry
      redirect to '/signup'
    elsif params[:last_name].empty?
      session[:fail] = "Please specify last name"
      redirect to '/signup'
    elsif params[:user_name].empty?
      session[:fail] = "Please specify login name"
      redirect to '/signup'
    elsif params[:password].empty?
      session[:fail] = "Please specify password"
      redirect to '/signup'
    else
      session[:fail] = ""
      redirect to '/'
    end
  end

end