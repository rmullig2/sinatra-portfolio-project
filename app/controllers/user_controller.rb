require './config/environment'

class UserController < ApplicationController

  get '/signup' do
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
    if logged_in?
      flash[:notice] = 'You are already signed in'
      redirect to "/users/#{current_user.user_name}"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    if valid_user?
      session[:user_id] = @user.id
      if admin_user?
        redirect to "/admin/home"
      else
        redirect to "/users/#{@user.user_name}"
      end
    else
      flash[:notice] = "Invalid username or password"
      redirect to '/login'
    end
  end

  get '/users/:user_name/?' do
    if admin_user?
      redirect to "/admin/home"
    else
      erb :'/users/home'
    end
  end

  get '/logout' do
    session.clear
    flash[:notice] = "You have logged out"
    redirect to '/'
  end

  get '/about' do
    erb :'/about'
  end

end
