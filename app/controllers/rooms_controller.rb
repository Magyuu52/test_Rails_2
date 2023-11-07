class RoomsController < ApplicationController

  def index
    @rooms = Room.where(user_id: @current_user.id)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :detail, :price, :adress, :image_room))
    @room.user_id = @current_user.id
    if @room.save
      flash[:notice] = "新規の施設登録に成功しました"
      redirect_to :rooms_index
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :detail, :price, :adress, :image_room))
      flash[:notice] = "「#{@room.name}」の情報を更新しました"
      redirect_to ('/')
    else
      render "edit"
    end
  end

  def destroy
     @room = Room.find(params[:id])
     @room.destroy
     flash[:notice] = "「#{@room.name}」を削除しました"
     redirect_to :rooms_index
  end

  def search
    @area_keyword = params[:area_keyword]
    @any_keyword = params[:any_keyword]
    if params[:area_keyword].present?
      @rooms = Room.where("adress like ?", "%#{params[:area_keyword]}%")
    elsif params[:any_keyword].present?
      @rooms = Room.where("name like ?","%#{params[:any_keyword]}%").or(Room.where("detail like ?","%#{params[:any_keyword]}%"))
    else
      @rooms = Room.all
    end
    @area_rooms_count = Room.where("adress like ?", "%#{params[:area_keyword]}%").count
    @anyword_rooms_count = Room.where("name like ?","%#{params[:any_keyword]}%").or(Room.where("detail like ?","%#{params[:any_keyword]}%")).count
    @all_rooms_count = Room.all.count
  end

end
