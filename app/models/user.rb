class User < ActiveRecord::Base
  has_secure_password
  has_many :players
  
  validates :first_name, :last_name, :user_name, :password, presence: true
  
  end
