require 'httparty'
require_relative 'reservation_response'

class ReservationService

  BASE_URI = 'http://5df9c4eee9f79e0014b6b2eb.mockapi.io/charge/'

  def self.call(params = {})
    return bad_params if invalid?(params)

    HTTParty.post(BASE_URI + params[:card_id], params)
            .then { |response| parse_with_symbols(response) }
            .then { |rb_hash| ResponseHandler.call(rb_hash) }
  end

  private

  def self.invalid?(params)
    [:card_id, :amount, :currency].any? {|el| params[el] == nil }
  end

  def self.bad_params
    {
      error: {
        message: "Invalid request parameters",
        type: "Invalid request error"
      }
    }.to_json
  end

  def self.parse_with_symbols(response)
    JSON.parse(response.body, symbolize_names: true)
  end


end



puts ReservationService.call({card_id: '40000007600000', amount: 45, currency: "USD" })
