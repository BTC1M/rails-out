class EventsController < ApplicationController
  def index
    @places = Place.geocoded # returns places with coordinates

    @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: place.events.where("date > ?", Date.current).order(start_time: :asc).first}),
        image_url: helpers.asset_url('red-dot.png')
      }
    end
  end

  def show
    @event = Event.find(params[:id])
  end

end
