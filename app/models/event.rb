class Event < ApplicationRecord

	def past?
      date.past?
    end

    def attendance?
    	if attendees.count > 0
    		true
    	else 
    		false
    	end
    end

    def attendee?(user)
      puts attendees.where(id: user)
      if attendees.where(id: user).count > 0
        true
      else
        false
      end
    end

    scope :upcoming_events, -> {where('date > ?', Date.today).order(date: :desc)}
    scope :previous_events, -> {where('date < ?', Date.today).order(date: :desc)}

	belongs_to :creator, class_name: "User"
	has_many :event_attendances, foreign_key: :attended_event_id
    has_many :attendees, through: :event_attendances, source: :event_attendee
end
