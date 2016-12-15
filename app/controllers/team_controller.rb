require './config/environment'

class TeamController < ApplicationController
  
  get '/team/home' do
    @user = User.find_by id: session[:id]
    erb :'/team/home'
  end
  
  post '/team/home' do
    @user = User.find_by id: session[:id]
    @team = Team.find_by name: params[:team_name]
    #binding.pry
    erb :'/team/detail'
  end
  
end