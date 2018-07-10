class AddDureeToEventType < ActiveRecord::Migration[5.1]
  def change
    add_column :event_types, :duree, :string
  end
end
