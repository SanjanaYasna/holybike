class PagesController < ApplicationController
  def index
    render :index
  end
  
  def placeholder
    render :placeholder
  end 

  def render_stations
    @stations = Station.all
    render :stations
  end
end
