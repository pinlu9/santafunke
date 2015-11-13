class UpdateJudgments < ActiveRecord::Migration
  def change
    add_column :judgments, :description, :string
    add_column :judgments, :naughty, :boolean, default: true
    add_column :judgments, :qualifying_adverb, :string
  end
end
