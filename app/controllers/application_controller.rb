require './config/environment'

class ApplicationController < Sinatra::Base
  
  register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "MLBFreeAgents"
  end
  
  get '/' do
    #binding.pry
    session[:fail] = ""
    erb :index
  end

end