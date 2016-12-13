require 'spec_helper'
require 'helpers'

describe PredictionController do
  
  describe "Prediction Creation" do
    
    it 'creates a new prediction' do
      users.each {|u| User.find_or_create_by(u) }
      teams.each {|t| Team.find_or_create_by(t) }
      players.each {|p| Player.find_or_create_by(p) }
      user = User.find_by user_name: "bcashman"
      player = Player.find_by name: "Chase Utley"
      team = Team.find_by name: "Minnesota Twins"
      contract = Contract.new( { :years => 1, :value => 4.5 } )
      contract.save
      Prediction.create( { :user_id => user.id, :player_id => player.id,
                           :team_id => team.id, :contract_id => contract.id } )
      expect(Prediction.last.player_id).to eq(player.id)
   end
    
    it 'modifies an existing prediction' do
      users.each {|u| User.find_or_create_by(u) }
      teams.each {|t| Team.find_or_create_by(t) }
      players.each {|p| Player.find_or_create_by(p) }
      user = User.find_by user_name: "bcashman"
      player = Player.find_by name: "Chase Utley"
      team = Team.find_by name: "Minnesota Twins"
      contract = Contract.new( { :years => 1, :value => 4.5 } )
      contract.save
      Prediction.create( { :user_id => user.id, :player_id => player.id,
                           :team_id => team.id, :contract_id => contract.id } )
      Prediction.update(Prediction.last.id, :team_id => 15)
      expect(Prediction.last.team_id).to eq(15)
    end
    
  end

end