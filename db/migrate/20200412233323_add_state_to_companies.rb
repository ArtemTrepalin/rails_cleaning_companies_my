class AddStateToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :state, :string, null: false
  end
end
