class CreateBacklogs < ActiveRecord::Migration[5.1]
  def change
    create_table :backlogs do |t|
      t.string :mfc
      t.string :mac
      t.string :mb
      t.string :ob
      t.integer :quart
      t.string :week

      t.timestamps
    end
  end
end
