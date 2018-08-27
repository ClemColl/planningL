class CreateAppros < ActiveRecord::Migration[5.1]
  def change
    create_table :appros do |t|
      t.string :ghh
      t.string :ghm
      t.string :sghh
      t.string :sghm

      t.timestamps
    end
  end
end
