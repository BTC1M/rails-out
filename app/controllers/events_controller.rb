class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @places = Place.geocoded # returns places with coordinates

    @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: place.events.where("date >= ?", Date.current).order(start_time: :asc).first}),
        image_url: helpers.asset_url('point-grey.png')
      }
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
