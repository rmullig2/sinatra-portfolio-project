require './config/environment'

class UserController < ApplicationController

  get '/signup' do
    @failure_message = session[:fail] || @failure_message = ""
    erb :'/users/create'
  end

  post '/signup' do
     if !logged_in?
       @user = User.new(params)
       if @user.save
         session[:user_id] = @user.id
         flash[:notice] = 'User was successfully created!'
         redirect to "/users/#{@user.user_name}"
       else
         flash[:notice] = @user.errors.full_messages
         redirect to "/signup"
       end
     else
       flash[:notice] = 'You are already signed in'
       redirect to "/users/#{current_user.user_name}"
     end
  end

  get '/login/?' do
    @failure_message = session[:fail] || @failure_message = ""
    erb :'/users/login'
  end

  post '/login' do
    if logged_in?
      session[:id] = @user.id
      #if session[:id] == 1
      if admin_user?
        redirect to "/admin/home"
      else
        redirect to "/users/#{@user.user_name}"
      end
    else
      redirect to '/login'
    end
  end

  get '/users/:user_name/?' do
    @user = User.find_by id: session[:id]
    #binding.pry
    #if session[:id] == 1
    if admin_user?
      redirect to "/admin/home"
    else
      erb :'/users/home'
    end
  end

  get '/logout' do
    session.clear
    #binding.pry
    redirect to '/'
  end

  get '/about' do
    erb :'/about'
  end

end
