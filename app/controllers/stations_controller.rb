class StationsController < ApplicationController
  
  def index
    if params[:reverse].blank? || params[:reverse]== "0"
      @stations = Station.all.order(identifier: :asc)
    else
      @stations = Station.all.order(identifer: :desc)
    end
  end

#def show
 # @station = Station.find(params[:id])
  #@station.docked_bikes.each do |bike|
   # @bikes = bike 
  #end
#end
end
