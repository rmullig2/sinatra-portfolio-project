require './config/environment'

class AdminController < ApplicationController
  
  get '/admin/home' do
    @user = User.find_by id: session[:id]
    erb :'/admin/home'
  end
  
end