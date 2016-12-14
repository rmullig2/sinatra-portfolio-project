require './config/environment'

class AdminController < ApplicationController
  
  get '/admin/home' do
    @user = User.find_by id: session[:id]
    erb :'/admin/home'
  end
  
  get '/admin/users' do
    @user = User.find_by id: session[:id]
    if @user.id == 1
        erb :'/admin/users'
    else
      redirect to '/logout'
    end
  end
  
  patch '/admin/users' do
    @user = User.find_by id: session[:id]
    if @user.id == 1
        User.destroy(params[:user_id])
        erb :'/admin/users'
    else
      redirect to '/logout'
    end
    #binding.pry
  end
  
end