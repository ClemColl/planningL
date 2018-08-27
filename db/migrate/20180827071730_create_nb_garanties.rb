class CreateNbGaranties < ActiveRecord::Migration[5.1]
  def change
    create_table :nb_garanties do |t|
      t.string :ge
      t.string :gcp
      t.string :gar

      t.timestamps
    end
  end
end
