class AddWeekToRapport < ActiveRecord::Migration[5.1]
  def change
    add_column :rapports, :week, :string
  end
end
