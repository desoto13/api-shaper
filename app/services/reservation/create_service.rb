class Reservation::CreateService
  attr_reader :errors

  def initialize(params)
    @guest_params = params[:guest]
    @reservation_params = params[:reservation]
    @errors = []
  end

  def exec
    return false unless guest

    guest.reservations.create!(@reservation_params)
  rescue StandardError => e
    @errors << e.message
    nil
  end

  private

  def guest
    begin
      @guest ||= Guest.find_or_create_by!(@guest_params)
    rescue StandardError => e
      @errors << e.message
      nil
    end
  end
end
