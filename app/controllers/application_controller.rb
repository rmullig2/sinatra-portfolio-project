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
    session[:fail] = ""
    erb :index
  end
  
  get '/standings' do
    @standings = get_standings
    erb :standings
    #binding.pry
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
      @user = User.find_by user_name: params[:user_name]
      if params[:user_name].empty?
        session[:fail] = "Please specify user name"
        false
      elsif @user.nil?
        session[:fail] = "User name does not exist"
        false
      elsif @user.authenticate(params[:password]) == false
        session[:fail] = "Incorrect password"
        false
      else
        session[:fail] = ""
        session[:id] = @user.id
        true
      end
    end
    
    def admin_user?
        @user.id == 1
    end
    
    def delete_late
        User.all.each do |u|
          u.predictions.each do |p|
            signed = Signing.find_by player_id: p.player_id
            if !signed.nil? && signed.signing_time < p.created_at
              p.destroy
            end
          end
        end
    end
    
    def get_standings
        standings = []
        User.all.each do |u|
          if u.id == 1
            next
          end
          score = 0
          u.predictions.each do |p|
            signed = Signing.find_by player_id: p.player_id
            if !signed.nil?
              if signed.player_id == p.player.id
                score += 20
              end
              contract = Contract.find_by id: p.contract_id
              score += 10 -  2 * (signed.years - contract.years).abs
              score += 10 - ((signed.value - contract.value).abs).round
            end
          end
          standings << [u.user_name, score]
        end
        standings
    end
    
  end

end