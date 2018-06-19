class AddQuarterToRapports < ActiveRecord::Migration[5.1]
  def change
    add_column :rapports, :quart, :integer
  end
end
