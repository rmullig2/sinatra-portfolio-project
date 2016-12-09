class CreateContractss < ActiveRecord::Migration
  def change
    create_table :contracts do |c|
      t.integer :years
      t.float :value
    end
  end
end