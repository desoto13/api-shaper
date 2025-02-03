require 'rails_helper'

RSpec.describe PayloadStandardizerService, type: :service do
  let(:payload_1) do
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

  let(:payload_2) do
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

  let(:standardized_result_for_payload_1) do
    {
      guest: {
        id_number: 1,
        email: "wayne_woodbridge@bnb.com",
        first_name: "Wayne",
        last_name: "Woodbridge",
        phone: [ "639123456789" ]
      },
      reservation: {
        start_date: "2021-03-12",
        end_date: "2021-03-16",
        number_of_nights: 4,
        number_of_guests: 4,
        number_of_adults: 2,
        number_of_children: 2,
        number_of_infants: 0,
        status: "accepted",
        currency: "AUD",
        payout_price: "3800.00",
        security_price: "500",
        total_price: "4500.00"
      }
    }
  end

  let(:standardized_result_for_payload_2) do
    {
      guest: {
        id_number: 1,
        email: "wayne_woodbridge@bnb.com",
        first_name: "Wayne",
        last_name: "Woodbridge",
        phone: [
          "639123456789",
          "639123456789"
        ]
      },
      reservation: {
        start_date: "2021-03-12",
        end_date: "2021-03-16",
        number_of_nights: 4,
        number_of_guests: 4,
        number_of_adults: 2,
        number_of_children: 2,
        number_of_infants: 0,
        status: "accepted",
        currency: "AUD",
        payout_price: "3800.00",
        security_price: "500.00",
        total_price: "4500.00"
      }
    }
  end

  describe '#exec' do
    context 'when using the first payload' do
      let(:service) { PayloadStandardizerService.new(ActionController::Parameters.new(payload_1)) }

      it 'returns the expected standardized guest and reservation data' do
        result = service.exec
        expect(result).to eq(standardized_result_for_payload_1)
      end
    end

    context 'when using the second payload' do
      let(:service) { PayloadStandardizerService.new(ActionController::Parameters.new(payload_2)) }

      it 'returns the expected standardized guest and reservation data' do
        result = service.exec
        expect(result).to eq(standardized_result_for_payload_2)
      end
    end
  end
end
