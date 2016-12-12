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
  
  helpers do
    def valid_user?
      if params[:first_name].empty?
        session[:fail] = "Please specify first name"
        false
      elsif params[:last_name].empty?
        session[:fail] = "Please specify last name"
        false
      elsif params[:user_name].empty?
        session[:fail] = "Please specify login name"
        false
      elsif params[:password].empty?
        session[:fail] = "Please specify password"
        false
      else
        session[:fail] = ""
        true
      end
    end
  end

end