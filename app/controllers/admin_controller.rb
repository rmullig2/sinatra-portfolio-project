require './config/environment'

class AdminController < ApplicationController
  
  get '/admin/home' do
    erb :'/admin/home'
  end
  
  get '/admin/users' do
    if admin_user?
        erb :'/admin/users'
    else
      redirect to '/logout'
    end
  end
  
  patch '/admin/users' do
    if admin_user?
        User.destroy(params[:user_id])
        erb :'/admin/users'
    else
      redirect to '/logout'
    end
  end
  
  get '/admin/signings' do
#    @user = User.find_by id: session[:id]
    if admin_user?
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
    time = DateTime.new(params[:sign_year].to_i, params[:sign_month].to_i,
                    params[:sign_day].to_i, params[:sign_hour].to_i,
                    params[:sign_minute].to_i)
    Signing.create(:player_id => player.id, :team_id => team.id, :years => years,
                   :value => value, :signing_time => time)
    delete_late
    redirect to '/admin/signings'
  end
  
end