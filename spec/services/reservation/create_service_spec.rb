require 'rails_helper'

RSpec.describe Reservation::CreateService, type: :service do
  let(:guest_params) do
    {
      first_name: "Wayne",
      last_name: "Woodbridge",
      email: "wayne_woodbridge@bnb.com",
      phone: [ "639123456789" ]
    }
  end

  let(:reservation_params) do
    {
      start_date: "2021-03-12",
      end_date: "2021-03-16",
      number_of_nights: 4,
      number_of_guests: 4,
      status: "accepted",
      currency: "AUD",
      payout_price: "3800.00",
      security_price: "500",
      total_price: "4500.00"
    }
  end

  let(:standardized_params) do
    {
      guest: guest_params,
      reservation: reservation_params
    }
  end

  let(:service) { Reservation::CreateService.new(standardized_params) }

  describe '#exec' do
    context 'when guest and reservation are valid' do
      it 'creates the reservation successfully' do
        expect { service.exec }.to change { Guest.count }.by(1).and change { Reservation.count }.by(1)
      end
    end

    context 'when guest creation fails due to invalid guest data' do
      before do
        standardized_params[:guest][:email] = nil
      end

      it 'does not create the guest and returns an error' do
        service.exec
        expect(service.errors).to include("Validation failed: Email can't be blank")
      end
    end

    context 'when reservation creation fails due to invalid reservation data' do
      before do
        standardized_params[:reservation][:start_date] = nil
      end

      it 'does not create the reservation and returns an error' do
        service.exec
        expect(service.errors).to include("Validation failed: Start date can't be blank")
      end
    end

    context 'when both guest and reservation creation fail due to invalid data' do
      before do
        standardized_params[:guest][:email] = nil
        standardized_params[:reservation][:start_date] = nil
      end

      it 'does not create either and returns the first error' do
        service.exec
        expect(service.errors).to include("Validation failed: Email can't be blank")
      end
    end
  end
end
