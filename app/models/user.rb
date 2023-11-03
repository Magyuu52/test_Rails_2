class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :password_confim, presence: true
    validate :check_password
    has_many :rooms
    has_many :reservations

    has_one_attached :image_name
    
    def check_password
        errors.add(:確認用パスワード,"が一致しません。正しく入力してください") if password_confim != password
    end
end
