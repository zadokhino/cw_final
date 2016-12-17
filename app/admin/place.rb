ActiveAdmin.register Place do
	permit_params :title, :description, :main_photo, :status, :user_id, :category_id

end
