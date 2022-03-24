class AddLevelOfStockToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :level_of_stock, :integer, :after => :price
  end
end
