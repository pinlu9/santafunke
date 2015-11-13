class SetDefaultAddress < ActiveRecord::Migration
  def change
    change_column :users, :address, :string, :default => "101 St Nicholas Dr, North Pole, AK 99705"
  end
end
