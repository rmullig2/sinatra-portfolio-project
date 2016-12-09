class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :teams do |p|
      t.string :name
    end
  end
end