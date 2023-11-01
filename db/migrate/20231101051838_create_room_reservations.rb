class CreateRoomReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :room_reservations do |t|
      t.references :room, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
