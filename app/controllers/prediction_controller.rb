require './config/environment'

class PredictionController < ApplicationController
  
  patch '/users/:user_name' do
    @user = User.find_by id: session[:id]
    @player =  Player.find_by name: params[:player_name]
    @team = Team.find_by name: params[:team_name]
    @contract = Contract.create( { :years => params[:years].to_i,
                                 :value => params[:value].to_f } )
    @prediction = Prediction.create( { :user_id => @user.id, :player_id => @player.id,
                                       :team_id => @team.id, :contract_id => @contract.id } )
    @user.predictions << @prediction
    binding.pry
    redirect to "/users/#{@user.user_name}"
  end
  
  get '/users/:user_name/modify' do
    @user = User.find_by id: session[:id]
    #binding.pry
    erb :'/predictions/modify'
  end
  
end