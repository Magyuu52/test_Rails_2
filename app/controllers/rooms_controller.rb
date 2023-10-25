class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :detail, :price, :adress, :image_room))
    if @room.save
      redirect_to ('/')
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :detail, :price, :adress, :image_room))
      redirect_to ('/')
    else
      render "edit"
    end
  end

  def destroy
  end

end
