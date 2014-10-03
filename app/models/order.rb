class Order < ActiveRecord::Base

	belongs_to :user
	belongs_to :room

	def save_with_payment!
		# Set your secret key: remember to change this to your live secret key in production
			# See your keys here https://dashboard.stripe.com/account
			Stripe.api_key = Rails.application.secrets.stripe_secret_key

			# Get the credit card details submitted by the form
			token = self.stripe_token

			# Create the charge on Stripe's servers - this will charge the user's card
			begin
			  charge = Stripe::Charge.create(
			    :amount => self.room.price_in_pence, # amount in pence, again
			    :currency => "gbp",
			    :card => token,
			    :description => self.user.email
			  )
			self.save!
			rescue Stripe::CardError => e
			  # The card has been declined

			end
		end

end
