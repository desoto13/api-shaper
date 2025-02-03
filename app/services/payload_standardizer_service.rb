class PayloadStandardizerService
  def initialize(params)
    @params = params
  end

  def exec
    {
      guest: standard_guest_payload,
      reservation: standard_reservation_payload
    }
  end

  private

  def standard_guest_payload
    {
      id_number: keyword_value_finder("id"),
      email: keyword_value_finder("email"),
      first_name: keyword_value_finder("first_name"),
      last_name: keyword_value_finder("last_name"),
      phone: [ keyword_value_finder("phone") ].compact.flatten
    }
  end

  def standard_reservation_payload
    {
      start_date: keyword_value_finder("start_date"),
      end_date: keyword_value_finder("end_date"),
      number_of_nights: keyword_value_finder("nights"),
      number_of_guests: keyword_value_finder("guests"),
      number_of_adults: keyword_value_finder("adults"),
      number_of_children: keyword_value_finder("children"),
      number_of_infants: keyword_value_finder("infants"),
      status: keyword_value_finder("status"),
      currency: keyword_value_finder("currency"),
      payout_price: keyword_value_finder("payout"),
      security_price: keyword_value_finder("security"),
      total_price: keyword_value_finder("total")
    }
  end

  def keyword_value_finder(keyword)
    KeywordValueFinderService.new(@params, keyword).exec
  end
end
