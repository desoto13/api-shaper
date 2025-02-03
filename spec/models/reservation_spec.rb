require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Associations' do
    it { should belong_to(:guest) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:number_of_nights) }
    it { should validate_presence_of(:number_of_guests) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:currency) }
    it { should validate_presence_of(:payout_price) }
    it { should validate_presence_of(:security_price) }
    it { should validate_presence_of(:total_price) }
  end
end
