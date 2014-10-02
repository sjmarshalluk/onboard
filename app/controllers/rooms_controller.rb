class RoomsController < ApplicationController
  def index
  	@rooms = Room.all
  end

  def show
  end
  
  def new
  	@room = Room.new
  end

  def create
  	@room = Room.new(room_params)
  	if @room.save
  		flash[:success] = "All done"
  		redirect_to root_path
  	else
  		flash[:error] = "Nope"
  		render :new
  	end
  end

  def edit
  end

  private
  def room_params
  	params.require(:room).permit(:title, :address, :description, :no_of_rooms, :price_in_pence, :user_id)
  end
end
