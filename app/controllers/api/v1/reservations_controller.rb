class Api::V1::ReservationsController < ApplicationController
  def create
    service = Reservation::CreateService.new(reservation_params)

    if service.exec
      render json: { message: "Reservation has been created!" }, status: :ok
    else
      render json: { errors: service.errors }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    PayloadStandardizerService.new(params).exec
  end
end
