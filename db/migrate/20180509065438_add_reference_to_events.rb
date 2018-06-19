class AddReferenceToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :calendar, foreign_key: true
  end
end
