class CreateJoinTableOrderItem < ActiveRecord::Migration[6.1]
  def change
    create_join_table :orders, :items, table_name: 'order_items' do |t|
      t.index [:order_id, :item_id]
      t.integer :quantity
      t.decimal :item_price, precision: 10, scale: 2
    end
  end
end
