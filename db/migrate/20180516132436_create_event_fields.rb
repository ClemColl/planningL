class CreateEventFields < ActiveRecord::Migration[5.1]
  def change
    create_table :event_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :event_type, foreign_key: true

      t.timestamps
    end
  end
end
