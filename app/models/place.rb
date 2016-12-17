class Place < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :photos, dependent: :destroy 
	has_many :ratings, dependent: :destroy 

	has_attached_file :main_photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :main_photo, content_type: /\Aimage\/.*\z/

  validates :title, presence: true, length: { maximum: 50 }
  validates :category, presence: true
  validates :description, presence: true
  validates :agree, presence: true



	def average_bar_rating
		ratings = Rating.where(place_id: self.id)
		sum = 0
			ratings.each do |rating|
				sum += rating.bar.to_f
			end
		average = (sum / ratings.count).round(1)
	end

	def average_service_rating
		ratings = Rating.where(place_id: self.id)
		sum = 0
			ratings.each do |rating|
				sum += rating.service.to_f
			end
		average = (sum / ratings.count).round(1)
	end

	def average_atmosphere_rating
		ratings = Rating.where(place_id: self.id)
		sum = 0
			ratings.each do |rating|
				sum += rating.atmosphere.to_f
			end
		average = (sum / ratings.count).round(1)
	end

	def overall_rating
		ratings = Rating.where(place_id: self.id)
				sum = 0
			ratings.each do |rating|
				sum += rating.bar.to_f
				sum += rating.service.to_f
				sum += rating.atmosphere.to_f
			end
		(sum / 3 / ratings.count).round(1)
	end
end
