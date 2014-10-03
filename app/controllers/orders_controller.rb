class OrdersController < ApplicationController
	before_action :require_user, only: [:new, :create, :show]
	before_action :find_user, only: [:new, :create, :show]
	before_action :find_room, only: [:new, :create]

  def new
  	@order = @room.orders.new
  	@order.user_id = @user.id
  end

  def create
  	@order = @room.orders.new(order_params)
  	@order.user_id = @user.id
  	if @order.save_with_payment!
  		
  		flash[:success] = "Thanks for booking!"
  		redirect_to user_order_path(@user, @order)
  	else
  		flash[:error] = "That didnt work"
  		render :new
  	end
  end

  def show
  	@order = Order.find(params[:id])
  end


  private

  def order_params
  	params.require(:order).permit(:stripe_token, :user_id, :room_id)
  end

  def find_user
  	#current_user is a helper method from application controller
  	@user = current_user
  end

  def find_room
  	@room = Room.find(params[:room_id])
  end


end
