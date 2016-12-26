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
          if !u.admin
            score = get_score(u)
            standings << [score, u.user_name]
          end
        end
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
    
    def predictions
      preds = []
      current_user.predictions.each do |p|
        player = Player.find_by id: p.player_id
        contract = Contract.find_by id: p.contract_id
        team = Team.find_by id: p.team_id
        preds << [player.rank, player.name, team.name, contract.years, contract.value]
      end
      preds
    end
    
    def not_taken
      taken, free = [], []
      current_user.predictions.all.each { |p| taken << p.player_id }
      Signing.all.each {|s| taken << s.player_id }
      Player.order(:name).each do |p|
        if !taken.include? p.id
          free << p.name
        end
      end
      free
    end

  end

end
