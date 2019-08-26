class ArtistsController < ApplicationController
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
