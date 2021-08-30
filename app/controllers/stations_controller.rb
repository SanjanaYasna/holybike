class StationsController < ApplicationController
  
  def index
    @stations = Stations.all.order(identifier: :asc)
  end
  
end
