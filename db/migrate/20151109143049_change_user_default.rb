class ChangeUserDefault < ActiveRecord::Migration
  def change
    change_column :users, :type, :string, :default => "Child"
  end
end
