class ChangeAttendedEventsToSignUps < ActiveRecord::Migration[6.1]
  def change
    rename_table :attended_events, :sign_ups
  end
end
