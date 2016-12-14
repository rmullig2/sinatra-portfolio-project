require './config/environment'

class TeamController < ApplicationController
  
  get '/team/home' do
    erb :'/team/home'
  end

end