class ChangeEvents < ActiveRecord::Migration
  def up
  	rename_column :events, :starts_at, :start_time
  end

  def down
  	rename_column :events, :start_time, :starts_at
   end
end
