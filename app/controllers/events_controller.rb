class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

private

  def event_params
    params.require(:event).permit(:title, :description, :price, :category, :date, :start_time, :end_time, :photo)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
