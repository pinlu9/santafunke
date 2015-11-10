class AddDefaultTypeToUser < ActiveRecord::Migration
  def change
    change_column :users, :type, :string, :default => "child"
  end
end
