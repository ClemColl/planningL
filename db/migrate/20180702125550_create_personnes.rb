class CreatePersonnes < ActiveRecord::Migration[5.1]
  def change
    create_table :personnes do |t|
      t.string :name
      t.belongs_to :equipe, foreign_key: true

      t.timestamps
    end
  end
end
