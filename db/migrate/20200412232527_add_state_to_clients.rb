class AddStateToClients < ActiveRecord::Migration[6.0]
  def change
      add_column :clients, :state, :string, null: false
  end
end
