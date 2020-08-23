class EventsController < ApplicationController
include EventsHelper

before_action :current_user, :authenticate_user!
before_action :set_event, only: [:add_attendee, :remove_attendee]

	def new
  		@event = Event.new
  	end

	def create
		@event = @current_user.created_events.build
		@event.title = event_params[:title]
		@event.description = event_params[:description]
	  	
	  	@event.save

	  	flash.notice = "Dah buat event geng!"
	  	redirect_to event_path(@event)

  	end

  	def show
  		@event = Event.find(params[:id])
  	end

  	def index
  		@events = Event.all
  	end

  	def add_attendee
	   if @event.attendees.push(@current_user)
	      redirect_to event_path(@event), flash: { info: "Attendee Added!"}
	   else
	      redirect_to event_path(@event), flash: { warning: "Cannot add attendee!"}
	   end
	end

	def remove_attendee
		if @event.attendees.delete(@current_user.id)
	      redirect_to event_path(@event), flash: { info: "Attendee removed!"}
	    else
	      redirect_to event_path(@event), flash: { warning: "Cannot remove attendee!"}
	    end
	end

	def set_event
	    @event = Event.find(params[:id])
	end

end
