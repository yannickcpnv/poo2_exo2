class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :author, foreign_key: { to_table: :clients }
      t.references :target, polymorphic: true
      t.timestamps
    end
  end
end
