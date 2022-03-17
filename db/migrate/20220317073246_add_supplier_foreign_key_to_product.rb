class AddSupplierForeignKeyToProduct < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :supplier, foreign_key: { on_delete: :nullify, on_update: :cascade }
  end
end
