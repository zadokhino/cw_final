class Place < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :photos, dependent: :destroy 
	has_many :ratings, dependent: :destroy 

	has_attached_file :main_photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
		validates_attachment_content_type :main_photo, content_type: /\Aimage\/.*\z/
end
