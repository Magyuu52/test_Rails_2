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
      @room = Room.find_by(params[:reservation][:room_id])
			render "rooms/show"
		end
  end

  def create
    if @reservation = Reservation.create!(session[:reservation])
      redirect_to :reservations
    else
      render "reservation/confirm"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
     @reservation.destroy
     redirect_to :reservations
  end

  private
	def permit_params
		@target_res = params.require('reservation').permit(:check_in, :check_out, :total_price, :population, :user_id, :room_id)
	end
end
