class Reservation < ApplicationRecord
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :population, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :total_price, presence: true
  validate :stay_days_restriction
  validate :check_in_restriction
  belongs_to :room
  belongs_to :user

  def stay_days_restriction
      errors.add(:チェックアウト,"はチェックインより遅い日付を選択してください") if check_in > check_out
  end
    
  def check_in_restriction
      errors.add(:チェックイン,"は現在の日時より遅い日付を選択してください") if check_in < Time.now
  end
end
