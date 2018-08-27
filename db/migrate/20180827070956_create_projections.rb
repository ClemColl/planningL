class CreateProjections < ActiveRecord::Migration[5.1]
  def change
    create_table :projections do |t|
      t.string :obj
      t.string :prof_act
      t.string :proj

      t.timestamps
    end
  end
end
