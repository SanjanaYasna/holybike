class StationsController < ApplicationController
  
  def index
    if params[:reverse].blank? || params[:reverse]== "0"
      @stations = Station.all.order(identifier: :asc)
    else
      @stations = Station.all.order(identifer: :desc)
    end
    @stations = Station.all
    render json: @stations.to_json(only: [:id, :name, :latitude, :longitude])
  end
  
  def show
    @station = Station.find(params[:id])
    @bikes = @station.docked_bikes
    if @station.nil?
      flash[:alert] = "Station not found."
      redirect_to stations_path
    end

  end

  def render_stations_in_pages
    @stations = Station.all
    render partial: "/pages/index", locals: {stations: @stations}
  end
#def show
 # @station = Station.find(params[:id])
  #@station.docked_bikes.each do |bike|
   # @bikes = bike 
  #end
#end
end

