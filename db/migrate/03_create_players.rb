class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |p|
      p.string :name
      p.integer :rank
    end
  end
end
