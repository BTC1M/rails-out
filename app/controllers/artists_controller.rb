class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @artist = Artist.find(params[:id])
  end

  def upvote
    @artist = Artist.find(params[:id])
    @artist.liked_by current_user
    redirect_to @artist
  end

  def unvote
    @artist = Artist.find(params[:id])
    @artist.unliked_by current_user
    redirect_to @artist
  end
end
