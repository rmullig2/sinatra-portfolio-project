require './config/environment'

class PredictionController < ApplicationController

  patch '/users/:user_name' do
    if logged_in?
      @player =  Player.find_by name: params[:player_name]
      @team = Team.find_by name: params[:team_name]
      @contract = Contract.create( { :years => params[:years].to_i,
                                   :value => params[:value].to_f } )
      @prediction = Prediction.create( { :user_id => current_user.id, :player_id => @player.id,
                                         :team_id => @team.id, :contract_id => @contract.id } )
      current_user.predictions << @prediction
      redirect to "/users/#{current_user.user_name}"
    else
      redirect to "/"
    end
  end

  get '/users/:user_name/modify' do
    erb :'/predictions/modify'
  end

  patch '/users/:user_name/modify' do
    prediction = current_user.predictions.select {|p| p[:id] == params[:prediction_id].to_i }[0]
    team = Team.find_by name: params[:team_name]
    Prediction.update(prediction.id, :team_id => team.id)
    contract = Contract.find_by id: prediction.contract_id
    Contract.update(contract.id, :years => params[:years], :value => params[:value])
    delete_late
    redirect to "/users/#{current_user.user_name}"
  end

end
