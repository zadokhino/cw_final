class RatingsController < ApplicationController
	def new
		@rating = Rating.new
	end

	def create
		@rating = current_user.ratings.build(ratings_params)
		if @rating.save
			redirect_to places_path
		else 
			flash[:danger] = "Ошибка"
			redirect_to :back
		end
	end

	private
	def ratings_params
		params.require(:rating).permit(:bar, :service, :atmosphere, :review, :place_id)
	end	
end
