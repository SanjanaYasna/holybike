class BikesController < ApplicationController
  def index
    if params[:reverse].blank? || params[:reverse]== "0"
      @bikes = Bike.all.order(identifier: :asc)
    else
      @bikes = Bike.all.order(identifer: :desc)
    end
  end

  #def show
  #  @bikes = @stations.find(params[:stationspecific]).docked_bikes
  #end
end