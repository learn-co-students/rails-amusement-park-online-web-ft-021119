class AttractionsController < ApplicationController
  before_action :require_login
  before_action :require_admin, only: [:new, :create, :edit, :update]

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
    @ride = Ride.new
  end

  def index
    @user = User.find_by_id(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to new_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      redirect_to edit_attraction_path
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
