class AddWeekToAppro < ActiveRecord::Migration[5.1]
  def change
    add_column :appros, :week, :string
    add_column :nb_garanties, :week, :string
    add_column :projections, :week, :string
    add_column :suivi_infics, :week, :string
    add_column :suivi_perves, :week, :string
    add_column :temps_fabs, :week, :string
  end
end
