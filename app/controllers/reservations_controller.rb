class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :population))
    if @reservation.save
      redirect_to :reservations_index
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
end
