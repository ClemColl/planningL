class CreateSuiviPerves < ActiveRecord::Migration[5.1]
  def change
    create_table :suivi_perves do |t|
      t.string :obj
      t.string :bcs
      t.string :bct

      t.timestamps
    end
  end
end
