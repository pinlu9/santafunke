class AddressValidation < ActiveRecord::Migration
  def change
    change_column :users, :address, :string, null: false
  end
end
