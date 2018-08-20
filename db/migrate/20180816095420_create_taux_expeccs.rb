class CreateTauxExpeccs < ActiveRecord::Migration[5.1]
  def change
    create_table :taux_expeccs do |t|
      t.string :cmd
      t.string :obj
      t.string :total

      t.timestamps
    end
  end
end
