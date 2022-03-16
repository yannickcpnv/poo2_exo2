class AddTypeToClients < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :type, :string, :after => :id
  end
end
