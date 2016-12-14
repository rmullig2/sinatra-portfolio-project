require './config/environment'

class AdminController < ApplicationController
  
  get '/admin/home' do
    @user = User.find_by id: session[:id]
    erb :'/admin/home'
  end
  
  get '/admin/users' do
  end
  
end