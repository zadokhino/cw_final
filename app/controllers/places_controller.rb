class PlacesController < ApplicationController
	def index
		@places = Place.all
	end

	def new
		@place = Place.new
	end

	def create
		@place = current_user.places.build(places_params)
		if @place.save
			redirect_to place_path(@place)
		else 
			flash[:danger] = "Ошибка"
			redirect_to places_path
		end
	end

	def edit
		@place = Plcae.find(params[:place_id])
	end

	def update
		@place = Plcae.find(params[:place_id])
		if @place.update(places_params)
			redirect_to place_path(@place)
		else
			flash[:danger] = "Ошибка"
			render 'edit'
		end
	end

	def destroy
		@place = Plcae.find(params[:place_id])
		@place.destroy
		redirect_to places_path
	end

	private

	def places_params
		params.require(:place).permit(:title, :description, :main_photo, :user_id, :category_id)
	end	

end
