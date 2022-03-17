class InheritCompanyFromClient < ActiveRecord::Migration[6.1]
  def change
    change_table :clients do |t|
      t.string :brand
      t.integer :employees_number
    end
  end
end