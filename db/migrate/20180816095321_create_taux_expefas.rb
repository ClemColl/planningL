class CreateTauxExpefas < ActiveRecord::Migration[5.1]
  def change
    create_table :taux_expefas do |t|
      t.string :taux
      t.string :obj
      t.string :nbligne

      t.timestamps
    end
  end
end
