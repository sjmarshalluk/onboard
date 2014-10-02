class Room < ActiveRecord::Base

	validates :title, presence: true
	validates :address, presence: true
	validates :price_in_pence, presence: true
	validates :no_of_rooms, presence: true
	validates :is_featured, presence: true
	validates :description, length: {minimum: 10}

end
