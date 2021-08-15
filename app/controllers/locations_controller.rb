# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :authenticate_user!

  layout 'frame_pages'
  
  def index
    locations = current_user.locations

    render locals: { locations: locations }
  end

  def new
    location = Location.new

    render locals: { location: location }
  end

  def update
    location = current_user.locations.find(params[:id])

    if location.update(location_params)
      redirect_to locations_path
    else
      render :edit, locals: { location: location }
    end
  end

  def create
    location = current_user.locations.build(location_params)
    if location.save
      redirect_to locations_path, notice: 'Location created successfully'
    else
      render :new, locals: { location: location }
    end
  end

  def edit
    location = current_user.locations.find(params[:id])

    render locals: { location: location }
  end

  def destroy
    location = current_user.locations.find(params[:id])

    location.destroy!
    redirect_to locations_path, notice: 'Location successfully deleted'
  end

  def location_params
    params.require(:location).permit(:address, :capacity, :name)
  end
end
