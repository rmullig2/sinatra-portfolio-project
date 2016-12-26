require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "MLBFreeAgents"
  end

  get '/' do
    session[:fail] = ""
    erb :index
  end

  get '/standings' do
    @user = User.find_by id: session[:id]
    @standings = get_standings
    erb :standings
    #binding.pry
  end

  helpers do

    def valid_user?
      @user = User.find_by(:user_name => params[:user_name])
      @user && @user.authenticate(params[:password])
    end

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) unless session[:user_id] == nil
    end

    def admin_user?
        @user.admin
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
          #score = 0
          #u.predictions.each do |p|
          #  signed = Signing.find_by player_id: p.player_id
          #  if !signed.nil?
          #    if signed.team_id == p.team_id
          #      score += 20
          #    end
          #    contract = Contract.find_by id: p.contract_id
          #    score += 10 -  2 * (signed.years - contract.years).abs
          #    score += 10 - ((signed.value - contract.value).abs).round
          #  end
          #end
          score = get_score(u)
          standings << [score, u.user_name]
          #binding.pry
        end
        #binding.pry
        standings
    end
    
    def get_score(user)
      score = 0
      user.predictions.each do |p|
        signed = Signing.find_by player_id: p.player_id
          if !signed.nil?
            if signed.team_id == p.team_id
              score += 20
            end
            contract = Contract.find_by id: p.contract_id
            score += 10 -  2 * (signed.years - contract.years).abs
            score += 10 - ((signed.value - contract.value).abs).round
          end
        end
      score
    end

  end

end
