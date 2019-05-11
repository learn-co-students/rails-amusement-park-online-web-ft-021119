class AttractionsController < ApplicationController
  before_action :require_login, :current_user, only: [:show]
  before_action :require_login, :check_admin, only: [:new, :create, :edit, :update]
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    #binding.pry
    if @attraction.save
      flash[:notice] = "Successfully created new attraction."
      redirect_to attraction_path(@attraction)
    end
  end

  def show
    @user = current_user
    @ride = Ride.new
  end

  def edit
     Attraction.find_by_id(params[:id])
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def destroy
  end

    private
    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
    end

    def check_admin
      unless current_user.admin
        redirect_to attractions_path(@attraction)
      end
    end

    def set_attraction
      @attraction = Attraction.find_by_id(params[:id])
    end

end
