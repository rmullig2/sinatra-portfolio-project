class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |p|
      p.string :name
    end
  end
end