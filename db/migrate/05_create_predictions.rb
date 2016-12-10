class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |p|
      p.integer :user_id
      p.integer :player_id
      p.integer :team_id
      p.integer :contract_id
      p.timestamps null: false
    end
  end
end
