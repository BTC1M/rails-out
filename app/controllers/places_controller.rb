class PlacesController < ApplicationController
  before_action :set_place, only: [:edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to @place, notice: "Place was successfully created"
    else
      render :new
    end
  end

def edit; end

def update
  if @place.update(place_params)
    redirect_to @place, notice: 'Place was successfully updated.'
  else
    render :edit
  end
end

def destroy
  @place.destroy
  redirect_to dashboard_path, notice: 'Place was successfully destroyed.'
end

private

  def place_params
    params.require(:place).permit(:name, :details, :category, :address, :photo)
  end
  def set_place
    @place = Place.find(params[:id])
  end
end
