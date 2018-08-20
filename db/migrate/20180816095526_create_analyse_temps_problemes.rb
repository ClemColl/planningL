class CreateAnalyseTempsProblemes < ActiveRecord::Migration[5.1]
  def change
    create_table :analyse_temps_problemes do |t|
      t.string :tmpdef
      t.string :obj
      t.string :hdirect

      t.timestamps
    end
  end
end
