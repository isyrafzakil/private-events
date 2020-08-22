class EventsController < ApplicationController
include EventsHelper

before_action :current_user

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

end
