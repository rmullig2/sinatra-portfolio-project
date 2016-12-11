class Prediction < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, :player_id, :team_id, :contract_id, presence: true
  
end