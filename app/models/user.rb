class User < ApplicationRecord
	has_many :places, dependent: :destroy 
	has_many :ratings, dependent: :destroy 
	has_many :photos, dependent: :destroy 
end
