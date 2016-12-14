require './config/environment'

class TeamController < ApplicationController
  
  get '/team/home' do
    erb :'/team/home'
  end
  
  post '/team/detail' do
    @team = Team.find_by name: params[:team_name]
    binding.pry
  end

end