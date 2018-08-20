class CreateEcartStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :ecart_stocks do |t|
      t.string :valeur
      t.string :ecart
      t.string :obj

      t.timestamps
    end
  end
end
