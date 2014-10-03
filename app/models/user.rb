class User < ActiveRecord::Base

	#http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
	has_secure_password

	has_many :rooms

end
