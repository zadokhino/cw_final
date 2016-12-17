class PlacesController < ApplicationController
	before_action :not_authenticate_user, only: [:new]
	def index
		@categories = Category.all
	  if params[:query]
    	@places = Place.where("title LIKE (?)", "%#{params['query']}%").paginate(:page => params[:page], :per_page => 20)
  	else
    	@places = Place.all.paginate(:page => params[:page], :per_page => 20)
  	end
	end

	def show
		@place = Place.find(params[:id])
	end

	def new
		@place = Place.new
		@categories = Category.all
	end

	def create
		@place = current_user.places.build(places_params)
		if @place.save
			flash[:danger] = "Ваше заведение ожидает отправки"
			redirect_to place_path(@place)
		else 
			flash[:danger] = "Ошибка"
			redirect_to :back
		end
	end

	def edit
		@place = Place.find(params[:place_id])
	end

	def update
		@place = Place.find(params[:place_id])
		if @place.update(places_params)
			redirect_to place_path(@place)
		else
			flash[:danger] = "Ошибка"
			render 'edit'
		end
	end

	def destroy
		@place = Place.find(params[:place_id])
		@place.destroy
		redirect_to places_path
	end

	private

	def places_params
		params.require(:place).permit(:title, :description, :main_photo, :category_id, :agree, :status)
	end	

	def not_authenticate_user
		if !user_signed_in?
			flash[:danger] = "Вам необходимо зарегестрироваться или войти в систему"
			redirect_to root_path
		end
	end
end
