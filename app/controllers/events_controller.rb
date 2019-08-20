class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "Event was successfully created"
    else
      render :new
    end
  end

def edit; end

def update
  if @event.update(event_params)
    redirect_to @event, notice: 'Event was successfully updated.'
  else
    render :edit
  end
end

def destroy
  @event.destroy
  redirect_to dashboard_path, notice: 'Event was successfully destroyed.'
end

private

  def event_params
    params.require(:event).permit(:title, :description, :price, :category, :date, :start_time, :end_time, :photo)
  end
  def set_event
    @event = Event.find(params[:id])
  end
end
