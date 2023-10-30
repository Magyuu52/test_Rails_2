class CreateResavations < ActiveRecord::Migration[6.1]
  def change
    create_table :resavations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :population
      t.integer :total_price

      t.timestamps
    end
  end
end
