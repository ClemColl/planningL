class AddCalendarToTeams < ActiveRecord::Migration[5.1]
  def change
    add_reference :teams, :calendar, foreign_key: true
  end
end
