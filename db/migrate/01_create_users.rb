class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :first_name
      u.string :last_name
      u.string :user_name
      u.string :password
      u.string :password_digest
    end
  end
end