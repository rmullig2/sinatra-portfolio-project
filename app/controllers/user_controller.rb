require './config/environment'

class UserController < ApplicationController
  
  get '/signup/?' do
    @failure_message = session[:fail] || @failure_message = ""
    erb :'/users/create'
  end
  
  post '/signup' do
     if valid_user?
        @user = User.create(params)
        session[:id] = User.last.id
        #binding.pry
        redirect to "/users/#{@user.user_name}"
     else
       redirect to '/signup'
     end
  end

  get '/login/?' do
    @failure_message = session[:fail] || @failure_message = ""
    erb :'/users/login'
  end
  
  post '/login' do
    if logged_in?
      #binding.pry
      redirect to "/users/#{@user.user_name}"
    else
      redirect to '/login'
    end
  end
  
  get '/users/:user_name' do
    @user = User.find_by params[:id]
    #inding.pry
    erb :'/users/home'
  end
  
  patch '/users/:user_name' do
    #binding.pry
    redirect to '/users/params[:user_name]'
  end
  
  get '/logout' do
    session.clear
    binding.pry
    redirect to '/'
  end

end