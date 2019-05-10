class AttractionsController < ApplicationController

   before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

   #Set @user for views by calling current_user from ApplicationController
   before_action :current_user, only: [:index, :show]

   #Set @attraction by finding the Attraction with params[:id]
   before_action :current_attraction, only: [:show, :edit, :update, :destroy]

   def index
      @attractions = Attraction.all
   end

   def new
      @attraction = Attraction.new
   end

   def create
      @attraction = Attraction.new(attraction_params)
      if @attraction.save
         redirect_to attraction_path(@attraction)
      else
         render :new
      end
   end

   def show

   end

   def edit
      
   end

   def update
      if @attraction.update(attraction_params)
         redirect_to attraction_path(@attraction)
      else
         render :edit
      end
   end

   private
      def check_admin
         #pull current_user from session hash if logged in
         current_user
         if !!@user.admin
            return #continues if user is an admin
         else
            redirect_to root_path
         end
      end

      def current_attraction
         @attraction = Attraction.find_by(id: params[:id])
      end

      def attraction_params
         params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
      end
end