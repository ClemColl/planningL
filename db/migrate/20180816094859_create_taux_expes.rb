class CreateTauxExpes < ActiveRecord::Migration[5.1]
  def change
    create_table :taux_expes do |t|
      t.string :taux
      t.string :obj

      t.timestamps
    end
  end
end
