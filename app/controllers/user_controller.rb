require './config/environment'

class UserController < ApplicationController
  
  get '/signup/?' do
    @failure_message = session[:fail] || @failure_message = ""
    erb :'/users/create'
  end
  
  post '/signup' do
     if valid_user?
        redirect to '/'
     else
       redirect to '/signup'
     end
  end

  get '/login/?' do
    @failure_message = session[:fail] || @failure_message = ""
    erb :'/users/login'
  end

end