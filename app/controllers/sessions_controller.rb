class SessionsController < ApplicationController
  def new
  end

  # This logs us in
  def create
  	# We get the email and the password from the params object (up here)
  	@email = params[:session][:email]
  	@password = params[:session][:password]

  	# And query the users table for a user with email equal to @email
  	@user = User.find_by(email: @email)

  	# Only if there is a User with email equal to @email
  	# And that users password is correct, will be logged in
  	if @user.present? and @user.authenticate(@password)
  		# Personalised flash message. Anything inside #{ } is read as ruby
  		flash[:success] = "Welcome back #{@user.name}"
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		flash[:error] = "Try again"
  		render :new  		
  	end
  end

  # This logs us out
  def destroy
  	reset_session
  	flash[:success] = "You have logged out"
  	redirect_to root_path
  end

end
