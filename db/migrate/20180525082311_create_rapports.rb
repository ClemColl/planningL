class CreateRapports < ActiveRecord::Migration[5.1]
  def change
    create_table :rapports do |t|
      t.integer :cas
      t.integer :pdp
      t.integer :cta
      t.integer :dav
      t.integer :dsa
      t.belongs_to :machine, foreign_key: true

      t.timestamps
    end
  end
end
