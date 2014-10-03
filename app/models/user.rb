class User < ActiveRecord::Base

	#http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
	has_secure_password

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true

	has_many :rooms

end
