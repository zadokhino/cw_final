class PhotosController < ApplicationController
	def new
		@photo = Photo.new
	end
	def create
		@photo = current_user.photos.build(photos_params)
		if @photo.save
			redirect_to :back
		else 
			flash[:danger] = "Ошибка"
			redirect_to :back
		end
	end

	def photos_params
		params.require(:photo).permit(:image, :place_id)
	end	
end
