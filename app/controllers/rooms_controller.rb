class RoomsController < ApplicationController

	# call the require_method helper method before new and create (rather than individually further down)
	before_action :require_user, only: [:new, :create]
	before_action :current_user_owns_room, only: [:edit, :update]
	before_action :find_room, only: [:show, :edit, :update]

  def index
  	@rooms = Room.all
  end

  def show
  	# Was first: @room = Room.find(params[:id])
  	# Then to (with helper in appliaction controller): find_room
  	# Then moved to top
  end
  
  def new
  	# require_user
  	# used to be this, but need to pass through user id @room = Room.new

  	# Find the user from the URL
  	@user = User.find(params[:user_id])
  	@room = @user.rooms.new
  end

  def create
  	# require_user
  	@user = User.find(params[:user_id])
  	@room = @user.rooms.new(room_params)

  	@room.price_in_pence = params[:room][:price_in_pence] 

  	if @room.save
  		flash[:success] = "All done"
  		redirect_to root_path
  	else
  		flash[:error] = "Nope"
  		render :new
  	end
  end

  def edit
  	# moved to top: current_user_owns_room
  	# moved to top: @room = Room.find(params[:id])
  end

  def update
  	# moved to top: current_user_owns_room
  	# same as new apart from (same for most apps)
  	# .new beceomes .find
  	# .save becomes .update
  	# room_params moves to update
  	# moved to top: @room = Room.find(params[:id])
  	if @room.update(room_params)
  		flash[:success] = "All done"
  		redirect_to root_path
  	else
  		flash[:error] = "Nope"
  		render :new
  	end
  end

  def find_room
  	@room = Room.find(params[:id])
  end

  private
  def room_params
  	params.require(:room).permit(:title, :address, :description, :no_of_rooms, :price_in_pence, :user_id, :image)
  end
end
