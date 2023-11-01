class ReservationsController < ApplicationController
  before_action :permit_params, only: :confirm

  def index
    @reservations = Reservation.all
  end

  def confirm
    @reservation = Reservation.new(@target_res)
		session[:reservation] = @reservation
    @room = Room.find(params[:reservation][:room_id])
    @stay_days = (@reservation.check_out - @reservation.check_in).to_i
    @total_price = (@stay_days * @room.price * @reservation.population).to_i
		if @reservation.invalid?
			render "rooms/:id"
		end
  end

  def create
    if @reservation = Reservation.create!(session[:reservation])
      redirect_to :reservations
    else
      render "rooms/:id"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
	def permit_params
		@target_res = params.require('reservation').permit(:check_in, :check_out, :population)
	end
end
