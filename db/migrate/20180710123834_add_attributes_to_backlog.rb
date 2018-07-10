class AddAttributesToBacklog < ActiveRecord::Migration[5.1]
  def change
    add_column :backlogs, :mfcl, :string
    add_column :backlogs, :ytd, :string
    add_column :backlogs, :ytdl, :string
  end
end
