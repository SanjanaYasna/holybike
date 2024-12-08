class PagesController < ApplicationController
  def index
    render :index
  end
  
  def placeholder
    @stations = Station.all
    #puts @stations stations are received
    #puts the sttions objects into pages/placeholder page to be passed into index page for partial renderings ...
    render :placeholder, locals: {stations: @stations}
  end 

  def discounts
    render :discounts
  end

  def about
    render :about
  end

  def home
    render :home
  end
end
