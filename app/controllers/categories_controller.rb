class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		@places = Place.where(category_id: @category)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(categories_params)
		if @category.save
			redirect_to categories_path
		else 
			flash[:danger] = "Ошибка"
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(categories_params)
			redirect_to category_path(@category)
		else
			flash[:danger] = "Ошибка"
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end

	private

	def categories_params
		params.require(:category).permit(:title)
	end	
end
