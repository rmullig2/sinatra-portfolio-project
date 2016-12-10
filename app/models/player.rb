class Player < ActiveRecord::Base
  has_one :contract
  belongs_to :team
  belongs_to :user
  
  validates :name, presence: true
  
  end
