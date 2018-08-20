class CreateRotationStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :rotation_stocks do |t|
      t.string :rotation
      t.string :objectif
      t.string :mois

      t.timestamps
    end
  end
end
