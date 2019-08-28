class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @places = Place.geocoded # returns places with coordinates

    # @places sans les evenements dont la date < aujourd'hui
    @places_without = []
    @places.each do |place|
      place.events.each do |event|
        if event.date >= Date.today
          @places_without << place
        end
      end
    end
    # .uniq supprime tous les doublons qu'il pourrait y avoir
    @places_last = @places_without.uniq

    # Tous les evenements
    @markers = @places_last.map do |place|
      {
        type: place.category,
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: place.events.where("date >= ?", Date.today).order(start_time: :asc).first }),
        image_url: helpers.asset_url('point-grey.png')
      }
    end

    # Markers au format geoJSON pour les filtres
    @markers_geojson =
      {
        type: "FeatureCollection",
        features: []
      }
    @places_last.each do |place|
      @markers_geojson[:features] <<
        {
          type: "Feature",
          properties:
            {
              icon:
                {
                  icone: "music",
                  className: 'my-icon',
                  iconSize: nil
                },
              category: place.category,
              infoWindow: render_to_string(partial: "info_window", locals: { event: place.events.where("date >= ?", Date.today).order(start_time: :asc).first }),
              image_url: helpers.asset_url('point-grey.png')
            },
          geometry:
            {
              type: "Point",
              coordinates: [place.longitude, place.latitude]
            }
        }
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end

# "{
#   \"type\": \"FeatureCollection\",
#   \"features\": [{
#     \"type\": \"Feature\",
#     \"properties\": {
#       \"icon\": \"music\"
#     },
#     \"geometry\": {
#       \"type\": \"Point\",
#       \"coordinates\": [#{place.latitude}, #{place.longitude}]
#     }"
