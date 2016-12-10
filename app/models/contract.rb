class Contract < ActiveRecord::Base
  belongs_to :player
  
  validates :years, :value, presence: true
  
  end
