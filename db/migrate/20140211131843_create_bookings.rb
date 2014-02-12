class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.text :content
      t.integer  :reservation_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
