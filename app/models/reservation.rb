class Reservation < ApplicationRecord
    has_many :room_reservations
    has_many :rooms, through: :room_reservation
end
