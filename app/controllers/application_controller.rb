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
      user = User.find_by user_name: params[:user_name]
      if params[:first_name].empty?
        session[:fail] = "Please specify first name"
        false
      elsif params[:last_name].empty?
        session[:fail] = "Please specify last name"
        false
      elsif params[:user_name].empty?
        session[:fail] = "Please specify login name"
        false
      elsif user != nil
        session[:fail] = "That user name has already been selected"
        false
      elsif params[:password].empty?
        session[:fail] = "Please specify password"
        false
      else
        session[:fail] = ""
        true
      end
    end
    
    def logged_in?
      user = User.find_by user_name: params[:user_name]
      if params[:user_name].empty?
        session[:fail] = "Please specify user name"
        false
      elsif
        user.authenticate(params[:password]) == false
        session[:fail] = "Incorrect password"
        false
      else
        session[:fail] = ""
        true
      end
    end
    
  end

end