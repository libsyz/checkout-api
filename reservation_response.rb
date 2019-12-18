require 'pry-byebug'

class ReservationResponse
  attr_reader :status, :outcome, :failure_reason

  def initialize(response)
    @status = response[:status] || response.dig(:outcome, :network_status)
    @outcome = response[:outcome]
    @failure_reason = response.dig(:outcome, :reason)
  end
end

class ErrorResponse
  def initialize(response)
    @status = response[:status]
    @failure_reason = response[:reason]
  end

  def outcome
    nil
  end
end

class ResponseHandler
  def self.call(response)
    response.dig(:error, :message) ? ErrorResponse.new(error_params) : ReservationResponse.new(response)
  end

  def self.error_params
    {
      status: "invalid_card_id",
      reason: "card_number_invalid"
    }
  end
end



