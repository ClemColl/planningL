class AddObjectivesToAnalyzes < ActiveRecord::Migration[5.1]
  def change
    add_column :analyzes, :eff_obj, :float
    add_column :analyzes, :util_obj, :float
  end
end
