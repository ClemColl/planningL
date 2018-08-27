class CreateSuiviInfics < ActiveRecord::Migration[5.1]
  def change
    create_table :suivi_infics do |t|
      t.string :sps
      t.string :obj_p
      t.string :spc
      t.string :sls
      t.string :obj_l
      t.string :slc

      t.timestamps
    end
  end
end
