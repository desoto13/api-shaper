require 'rails_helper'

RSpec.describe 'Reservations#create', type: :request do
  let!(:payload_1) do
    {
      "start_date" => "2021-03-12",
      "end_date" => "2021-03-16",
      "nights" => 4,
      "guests" => 4,
      "adults" => 2,
      "children" => 2,
      "infants" => 0,
      "status" => "accepted",
      "guest" => {
        "id" => 1,
        "first_name" => "Wayne",
        "last_name" => "Woodbridge",
        "phone" => "639123456789",
        "email" => "wayne_woodbridge@bnb.com"
      },
      "currency" => "AUD",
      "payout_price" => "3800.00",
      "security_price" => "500",
      "total_price" => "4500.00"
    }
  end

  let!(:payload_2) do
    {
      "reservation" => {
        "start_date" => "2021-03-12",
        "end_date" => "2021-03-16",
        "expected_payout_amount" => "3800.00",
        "guest_details" => {
          "localized_description" => "4 guests",
          "number_of_adults" => 2,
          "number_of_children" => 2,
          "number_of_infants" => 0
        },
        "guest_email" => "wayne_woodbridge@bnb.com",
        "guest_first_name" => "Wayne",
        "guest_id" => 1,
        "guest_last_name" => "Woodbridge",
        "guest_phone_numbers" => [
          "639123456789",
          "639123456789"
        ],
        "listing_security_price_accurate" => "500.00",
        "host_currency" => "AUD",
        "nights" => 4,
        "number_of_guests" => 4,
        "status_type" => "accepted",
        "total_paid_amount_accurate" => "4500.00"
      }
    }
  end

  describe 'Using payload_1' do
    context 'when guest and reservation are valid' do
      before do
        post '/api/v1/reservations', params: payload_1
      end

      it 'returns a status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'creates the reservation successfully' do
        expect(JSON.parse(response.body)['message']).to eq('Reservation has been created!')
      end
    end

    context 'when guest creation fails due to invalid guest data' do
      before do
        payload_1['guest']['email'] = nil
        post '/api/v1/reservations', params: payload_1
      end

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create the guest and returns an error' do
        expect(JSON.parse(response.body)['errors']).to include("Validation failed: Email can't be blank")
      end
    end

    context 'when reservation creation fails due to invalid reservation data' do
      before do
        payload_1['start_date'] = nil
        post '/api/v1/reservations', params: payload_1
      end

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create the reservation and returns an error' do
        expect(JSON.parse(response.body)['errors']).to include("Validation failed: Start date can't be blank")
      end
    end

    context 'when both guest and reservation creation fail due to invalid data' do
      before do
        payload_1['guest']['email'] = nil
        payload_1['start_date'] = nil
        post '/api/v1/reservations', params: payload_1
      end

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create either and returns the first error' do
        expect(JSON.parse(response.body)['errors']).to include("Validation failed: Email can't be blank")
      end
    end
  end

  describe 'Using payload_2' do
    context 'when guest and reservation are valid' do
      before do
        post '/api/v1/reservations', params: payload_2
      end

      it 'returns a status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'creates the reservation successfully' do
        expect(JSON.parse(response.body)['message']).to eq('Reservation has been created!')
      end
    end

    context 'when guest creation fails due to invalid guest data' do
      before do
        payload_2['reservation']['guest_email'] = nil
        post '/api/v1/reservations', params: payload_2
      end

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create the guest and returns an error' do
        expect(JSON.parse(response.body)['errors']).to include("Validation failed: Email can't be blank")
      end
    end

    context 'when reservation creation fails due to invalid reservation data' do
      before do
        payload_2['reservation']['start_date'] = nil
        post '/api/v1/reservations', params: payload_2
      end

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create the reservation and returns an error' do
        expect(JSON.parse(response.body)['errors']).to include("Validation failed: Start date can't be blank")
      end
    end

    context 'when both guest and reservation creation fail due to invalid data' do
      before do
        payload_2['reservation']['guest_email'] = nil
        payload_2['reservation']['start_date'] = nil
        post '/api/v1/reservations', params: payload_2
      end

      it 'returns a status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create either and returns the first error' do
        expect(JSON.parse(response.body)['errors']).to include("Validation failed: Email can't be blank")
      end
    end
  end
end
