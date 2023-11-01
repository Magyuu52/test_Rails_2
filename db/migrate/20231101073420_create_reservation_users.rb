class CreateReservationUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
