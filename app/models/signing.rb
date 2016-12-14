class Prediction < ActiveRecord::Base
  
  validates :date, :player_id, :team_id, :years, :value, presence: true
  
end