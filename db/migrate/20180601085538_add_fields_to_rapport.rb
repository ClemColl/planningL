class AddFieldsToRapport < ActiveRecord::Migration[5.1]
  def change
    add_column :rapports, :next_cas, :integer
    add_column :rapports, :next_pdp, :integer
  end
end
