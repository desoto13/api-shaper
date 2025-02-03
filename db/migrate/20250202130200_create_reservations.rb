class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.references :guest, null: false, foreign_key: true
      t.datetime :start_date, index: true, null: false
      t.datetime :end_date, index: true, null: false
      t.integer :number_of_nights, null: false
      t.integer :number_of_guests, null: false
      t.integer :number_of_adults
      t.integer :number_of_children
      t.integer :number_of_infants
      t.string :status, index: true, null: false
      t.string :currency, null: false
      t.float :payout_price, null: false
      t.float :security_price, null: false
      t.float :total_price, null: false
      t.timestamps
    end
  end
end
