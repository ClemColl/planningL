class CreateTempsFabs < ActiveRecord::Migration[5.1]
  def change
    create_table :temps_fabs do |t|
      t.string :tp
      t.string :tp_last

      t.timestamps
    end
  end
end
