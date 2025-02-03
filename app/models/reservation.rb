class Reservation < ApplicationRecord
  belongs_to :guest

  validates :start_date,
            :end_date,
            :number_of_nights,
            :number_of_guests,
            :status,
            :currency,
            :payout_price,
            :security_price,
            :total_price, presence: true
end
