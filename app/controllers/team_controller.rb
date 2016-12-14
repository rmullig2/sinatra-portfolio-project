require './config/environment'

class TeamController < ApplicationController
  
  get '/team/home' do
    erb :'/team/home'
  end
  
  post '/team/home' do
    @team = Team.find_by name: params[:team_name]
    #binding.pry
    erb :'/team/detail'
  end
  
end