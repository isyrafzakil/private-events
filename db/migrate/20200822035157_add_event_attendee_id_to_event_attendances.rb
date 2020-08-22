class AddEventAttendeeIdToEventAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :event_attendances, :event_attendee_id, :integer
  end
end
