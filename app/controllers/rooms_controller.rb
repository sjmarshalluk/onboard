class RoomsController < ApplicationController
  def index
  	@rooms = Room.where(title: 'Steve')
  end

  def show
  end

  def new
  	@room = Room.new
  end

  def edit
  end
end
