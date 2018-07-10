class AddUserCountToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :user_count, :integer
  end
end
