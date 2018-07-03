class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :analyzes, :type, :duree
  end
end
