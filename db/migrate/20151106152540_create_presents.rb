class CreatePresents < ActiveRecord::Migration
  def change
    create_table :presents do |t|
      t.references :child
      t.references :elf
      t.references :toy, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

# note that t.references does NOT include foreign_key, this is due to the use of class_name aliasing
