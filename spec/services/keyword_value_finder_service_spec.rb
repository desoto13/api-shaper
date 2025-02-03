require 'rails_helper'

RSpec.describe KeywordValueFinderService, type: :service do
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

  describe '#exec' do
    context 'when the payload is payload_1' do
      it 'returns the correct value for the "status" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "status")
        result = service.exec
        expect(result).to eq("accepted")
      end

      it 'returns the correct value for the "start_date" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "start_date")
        result = service.exec
        expect(result).to eq("2021-03-12")
      end

      it 'returns the correct value for the "end_date" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "end_date")
        result = service.exec
        expect(result).to eq("2021-03-16")
      end

      it 'returns the correct value for the "nights" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "nights")
        result = service.exec
        expect(result).to eq(4)
      end

      it 'returns the correct value for the "guests" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "guests")
        result = service.exec
        expect(result).to eq(4)
      end

      it 'returns the correct value for the "adults" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "adults")
        result = service.exec
        expect(result).to eq(2)
      end

      it 'returns the correct value for the "children" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "children")
        result = service.exec
        expect(result).to eq(2)
      end

      it 'returns the correct value for the "infants" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "infants")
        result = service.exec
        expect(result).to eq(0)
      end

      it 'returns the correct value for the "currency" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "currency")
        result = service.exec
        expect(result).to eq("AUD")
      end

      it 'returns the correct value for the "payout_price" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "payout")
        result = service.exec
        expect(result).to eq("3800.00")
      end

      it 'returns the correct value for the "security_price" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "security")
        result = service.exec
        expect(result).to eq("500")
      end

      it 'returns the correct value for the "total_price" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "total")
        result = service.exec
        expect(result).to eq("4500.00")
      end

      it 'returns nil if no matching keyword is found' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_1), "non_existent_keyword")
        result = service.exec
        expect(result).to be_nil
      end
    end

    context 'when the payload is payload_2' do
      it 'returns the correct value for the "status" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "status")
        result = service.exec
        expect(result).to eq("accepted")
      end

      it 'returns the correct value for the "start_date" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "start_date")
        result = service.exec
        expect(result).to eq("2021-03-12")
      end

      it 'returns the correct value for the "end_date" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "end_date")
        result = service.exec
        expect(result).to eq("2021-03-16")
      end

      it 'returns the correct value for the "nights" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "nights")
        result = service.exec
        expect(result).to eq(4)
      end

      it 'returns the correct value for the "guests" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "guests")
        result = service.exec
        expect(result).to eq(4)
      end

      it 'returns the correct value for the "adults" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "adults")
        result = service.exec
        expect(result).to eq(2)
      end

      it 'returns the correct value for the "children" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "children")
        result = service.exec
        expect(result).to eq(2)
      end

      it 'returns the correct value for the "infants" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "infants")
        result = service.exec
        expect(result).to eq(0)
      end

      it 'returns the correct value for the "currency" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "currency")
        result = service.exec
        expect(result).to eq("AUD")
      end

      it 'returns the correct value for the "payout_price" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "payout")
        result = service.exec
        expect(result).to eq("3800.00")
      end

      it 'returns the correct value for the "security_price" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "security")
        result = service.exec
        expect(result).to eq("500.00")
      end

      it 'returns the correct value for the "total_price" keyword' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "total")
        result = service.exec
        expect(result).to eq("4500.00")
      end

      it 'returns nil if no matching keyword is found' do
        service = KeywordValueFinderService.new(ActionController::Parameters.new(payload_2), "non_existent_keyword")
        result = service.exec
        expect(result).to be_nil
      end
    end
  end
end
