require './config/environment'

class UserController < ApplicationController
  
  get '/signup/?' do
    erb :'/users/create'
  end
  
  post '/signup' do
    #binding.pry
    if params[:first_name].empty?
      redirect to '/signup'
    elsif params[:last_name].empty?
      redirect to '/signup'
    elsif params[:user_name].empty?
      redirect to '/signup'
    else
      redirect to '/'
    end
  end

end