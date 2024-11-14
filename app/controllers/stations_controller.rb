class StationsController < ApplicationController
  
  def index
    if params[:reverse].blank? || params[:reverse]== "0"
      @stations = Station.all.order(identifier: :asc)
    else
      @stations = Station.all.order(identifer: :desc)
    end
  end
  
  def show
    puts Station.inspect()
    @station = Station.where(params[:identifier]) 
  end
end
