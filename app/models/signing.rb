class Signing < ActiveRecord::Base
  
  validates :signing_time, :player_id, :team_id, :years, :value, presence: true
  
end