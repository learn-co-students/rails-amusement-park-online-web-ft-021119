class AttractionsController < ApplicationController

  def index
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
  end
end
