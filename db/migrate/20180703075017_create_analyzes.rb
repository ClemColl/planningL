class CreateAnalyzes < ActiveRecord::Migration[5.1]
  def change
    create_table :analyzes do |t|
      t.references :equipe, foreign_key: true
      t.string :type
      t.float :efficacite
      t.float :utilisation

      t.timestamps
    end
  end
end
