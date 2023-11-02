class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :password_confim, presence: true
    has_many :rooms
    has_many :reservations

    has_one_attached :image_name
    
end
