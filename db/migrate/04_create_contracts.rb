class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |c|
      c.integer :years
      c.float :value
    end
  end
end