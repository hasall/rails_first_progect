class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :date_from
      t.datetime :date_to
      t.belongs_to :item, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
