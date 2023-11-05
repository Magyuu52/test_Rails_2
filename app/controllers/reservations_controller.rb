class ReservationsController < ApplicationController
  before_action :permit_params, only: :confirm

  def index
    @reservations = Reservation.where(user_id: @current_user)
    @reservations_room_id = Reservation.select(:room_id).where(user_id: @current_user)
    @room = Room.new
    @rooms = Room.where(id: @reservations_room_id)
  end

  def confirm
    @reservation = Reservation.new(@target_res)
		session[:reservation] = @reservation
    @room = Room.find(params[:reservation][:room_id])
    @stay_days = (@reservation.check_out - @reservation.check_in).to_i
    @reservation.population ||= 0
    @reservation.total_price = (@stay_days * @room.price * @reservation.population)
		if @reservation.invalid?
			render 'rooms/show'
		end
  end

  def create
    if @reservation = Reservation.create!(session[:reservation])
      flash[:notice] = "「#{@reservation.room.name}」の予約に成功しました"
      redirect_to :reservations
    else
      render "reservations/confirm"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
     @reservation.destroy
     flash[:notice] = "「#{@reservation.room.name}」の予約を削除しました"
     redirect_to :reservations
  end

  private
	def permit_params
		@target_res = params[:reservation].permit(:check_in, :check_out, :total_price, :population, :user_id, :room_id)
	end
end
