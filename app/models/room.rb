class Room < ApplicationRecord
    validates :name, presence: true
    validates :detail, presence: true
    validates :price, presence: true, numericality: {greater_than_or_equal_to: 1}
    validates :adress, presence: true
    has_one_attached :image_room
end
