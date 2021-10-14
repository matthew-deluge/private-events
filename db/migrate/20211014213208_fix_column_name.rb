class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :attended_events, :attended_event_id, :event_attended_id
  end
end
