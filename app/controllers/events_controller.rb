class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @places = Place.geocoded # returns places with coordinates

    @places_without = []
    @places.each do |place|
      place.events.each do |event|
        if event.date >= Date.today
          @places_without << place
        end
      end
    end
    @places_last = @places_without.uniq

    @markers = @places_last.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: place.events.where("date >= ?", Date.today).order(start_time: :asc).first }),
        image_url: helpers.asset_url('point-grey.png')
      }
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
