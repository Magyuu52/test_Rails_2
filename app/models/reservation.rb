class Reservation < ApplicationRecord
    has_many :room_reservations
    has_many :rooms, through: :room_reservations
    has_many :users, through: :reservation_users
    accepts_nested_attributes_for :reservation_users
end
