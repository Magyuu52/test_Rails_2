class Room < ApplicationRecord
    validates :name, presence: true
    validates :detail, presence: true
    validates :price, presence: true, numericality: {greater_than_or_equal_to: 1}
    validates :adress, presence: true
    belongs_to :user
    has_many :reservations
    
    has_one_attached :image_room

      def self.area_search(search)
        return Room.all unless search
        Room.where('adress LIKE(?)', "%#{search}%")
      end

      def self.anyword_search(search)
        return Room.all unless search
        Room.where('name LIKE(?) or detail LIKE(?)',"%#{search}%","%#{search}%")
      end
end
