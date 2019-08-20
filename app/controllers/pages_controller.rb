class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    @events = Event.all
    @user = current_user
  end

  def dashboard
    @events = Event.all
    @user = current_user
  end

  def discover
    @events = Event.all
    @user = current_user
  end
end
