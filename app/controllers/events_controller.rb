class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:profile]
  def index
    @random_number= rand(10000)
    @user = User.all.sample
    @all_event_array = Event.all
    @event = Event.all
  end

  #def new
  #end

  def show
    
    @event = Event.find(params[:id])
    @event_start_date = @event.start_date
    @event_duration = @event.duration
    @event_title = @event.title 
    @event_description = @event.description
    @event_price = @event.price
    @event_location = @event.location
    @event_author = @event.find_author_name
    @event_author_id = @event.admin_id.to_i
    
  end

  def create

  end

end