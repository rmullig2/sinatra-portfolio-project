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
  end
  
  get '/admin/signings' do
    @user = User.find_by id: session[:id]
    if @user.id == 1
        erb :'/admin/signings'
    else
      redirect to '/logout'
    end
  end
  
  patch '/admin/signings' do
    player =  Player.find_by name: params[:player_name]
    team = Team.find_by name: params[:team_name]
    years = params[:years].to_i
    value = params[:value].to_f
    time = Time.new(params[:sign_year].to_i, params[:sign_month].to_i,
                    params[:sign_day].to_i, params[:sign_hour].to_i,
                    params[:sign_minute].to_i)
    binding.pry
  end
  
end