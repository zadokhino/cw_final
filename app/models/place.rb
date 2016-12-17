class Place < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :photos, dependent: :destroy 
	has_many :ratings, dependent: :destroy 
end
