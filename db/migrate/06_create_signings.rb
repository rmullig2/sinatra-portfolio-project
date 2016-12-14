class CreateSignings < ActiveRecord::Migration
  def change
    create_table :signings do |s|
      s.datetime    :signing_time
      s.integer :player_id
      s.integer :team_id
      s.integer :years
      s.float   :value
    end
  end
end
