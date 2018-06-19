class AddTypeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_type_id, :integer
    add_column :events, :properties, :text
  end
end
