class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name
      t.integer :value
      t.string :description

      t.timestamps null: false
    end
  end
end
