require './config/environment'

class UserController < ApplicationController
  
  get '/signup/?' do
    @failure_message = session[:fail] || @failure_message = ""
    erb :'/users/create'
  end
  
  post '/signup' do
     if valid_user?
        User.create(params)
        session[:id] = User.last.id
        #binding.pry
        redirect to '/'
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
    #binding.pry
    erb :'/users/home'
  end

end