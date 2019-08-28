class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home discover] # , :raise => false

  def home
    @events = Event.all
    @user = current_user
    @artists = Artist.all
  end

  def dashboard
    @events = Event.all
    @user = current_user
    @artists = Artist.all
    @styles = Style.all
  end

  def discover
    @events = Event.all
    @user = current_user
  end

  def modalsignin
    respond_to do |format|
      format.html
      format.js
    end
  end
end
