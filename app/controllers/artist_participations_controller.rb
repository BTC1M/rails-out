class ArtistParticipationsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @artist_participation = ArtistParticipation.new
  end

  def create
    @artist_participation = ArtistParticipation.new(artist_participation_params)
    @event = Event.find(params[:event_id])
    @artist = Artist.new(name: 'Nom de l\'artiste...')
    @artist_participation.event = @event
    @artist_participation.artist = @artist

    if @artist_participation.save
      redirect_to event_path(@artist_participation.event.id), notice: 'Participation was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @artist_participation = ArtistParticipation.find(params[:id])
    @artist_participation.destroy
    redirect_to event_path(@artist_participation.event.id), notice: 'Participation was successfully destroyed.'
  end

  private

  def artist_participation_params
    params.require(:artist_participation).permit(:artist_id, :event_id)
  end
end
