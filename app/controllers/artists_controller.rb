class ArtistsController < ApplicationController
  before_action :set_artist, only: [:edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist, notice: "Artist was successfully created"
    else
      render :new
    end
  end

def edit; end

def update
  if @artist.update(artist_params)
    redirect_to @artist, notice: 'Artist was successfully updated.'
  else
    render :edit
  end
end

def destroy
  @artist.destroy
  redirect_to dashboard_path, notice: 'Artist was successfully destroyed.'
end

private

  def artist_params
    params.require(:artist).permit(:name, :category, :photo, :spotify_link)
  end
  def set_artist
    @artist = Artist.find(params[:id])
  end
end
