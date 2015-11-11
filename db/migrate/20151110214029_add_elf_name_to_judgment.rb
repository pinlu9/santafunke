class AddElfNameToJudgment < ActiveRecord::Migration
  def change
    add_column :judgments, :elf_name, :string
  end
end
