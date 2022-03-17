class InheritIndividualFromClient < ActiveRecord::Migration[6.1]
  def change
    change_table :clients do |t|
      t.boolean :premium
      t.integer :loyalty_points
    end
  end
end
