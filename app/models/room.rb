class Room < ActiveRecord::Base

	validates :title, presence: true
	validates :address, presence: true
	validates :price_in_pence, presence: true
	validates :no_of_rooms, presence: true
	# sayin that when it is created, the default is false (this is only on create)
	#validates :is_featured, presence: true #, inclusion: { in: [false]}, on: :create
	# this is on update as well
	#validates :is_featured, presence: true
	validates :description, length: {minimum: 10}


	has_attached_file :image, :styles => { :large => "1000x664>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	belongs_to :user
	has_many :orders

end
