class Team < ActiveRecord::Base
  has_many :players
  has_many :contracts, through: :players
  
  validates :name, presence: true
  
  end
