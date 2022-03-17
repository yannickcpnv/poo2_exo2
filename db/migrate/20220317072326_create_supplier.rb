class CreateSupplier < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :phone_number
    end
  end
end
