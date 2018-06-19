class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :week
      t.string :smc
      t.string :rmc
      t.string :sma
      t.string :rma

      t.timestamps
    end
  end
end
