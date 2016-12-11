require './config/environment'

class UserController < ApplicationController
  
  get '/signup/?' do
    erb :'/users/create'
  end
  
  post '/signup' do
    binding.pry
    erb :'/main'
  end

end