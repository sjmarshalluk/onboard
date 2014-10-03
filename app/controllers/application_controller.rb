class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	if session[:user_id].present?
  		User.find(session[:user_id])
  	end
  end

  def logged_in?
  	session[:user_id].present?
  end

  def require_user
  	unless logged_in?
  		flash[:error] = "You need to be logged in"
  		redirect_to new_session_path
  	end
  end

  # to prevent non-owners of rooms from editing (via url)
  def current_user_owns_room

  	# Then find the room that is trying to be edited
  	room = Room.find(params[:id])
  	# And only allow if current user made that room
  	unless logged_in? and current_user == room.user
  		# Otherwise flash error and redirect to show page
  		flash[:error] = "Only the owner can edit"
  		# (room) indicates the requirement for an id form the url
  		redirect_to room_path(room)  		
  	end
  end

  #these are now available everywhere as they are being defined in the Apllication controller
  # helper_method :require_user
  helper_method :current_user
  helper_method :logged_in?


end
