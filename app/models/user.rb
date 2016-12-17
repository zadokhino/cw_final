class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :places, dependent: :destroy 
	has_many :ratings, dependent: :destroy 
	has_many :photos, dependent: :destroy 
	has_many :ratings, dependent: :destroy 
	validates :name, presence: true, length: {maximum: 50}
end
