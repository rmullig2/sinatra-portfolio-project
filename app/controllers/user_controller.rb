require './config/environment'

class UserController < ApplicationController
  
  get '/signup' do
    erb :'/users/create'
  end

end