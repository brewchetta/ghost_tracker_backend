class Api::V1::SightingsController < ApplicationController

  def index
    @sightings = Sighting.all
    render json: @sightings, status: :ok
  end

  def show
    @sighting = Sighting.find_by(id: params[:id])
    render json: @sighting, status: :ok
  end

  def create
    @sighting = Sighting.create(sighting_params)
    if @sighting.valid?
      render json: @sighting, status: :ok
    else
      render json: @sighting.errors.full_messages, status: :not_acceptable
    end
  end
  # End create

  def update
    @sighting = Sighting.find_by(id: params[:id])
    @sighting.update(sighting_params)
    render json: @sighting, status: :ok
  end
  # End update

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy

    render json: @sighting, status: :ok
  end

  private

  def sighting_params
    params.require(:sighting).permit(:entity, :lat, :long, :description, :image, :monster_id, :confirmations)
  end

end
