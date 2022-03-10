class CreateProduct < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :total_price, precision: 10, scale: 2
      t.text :description
      t.references :category, foreign_key: true
    end
  end
end
