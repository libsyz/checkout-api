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
  def status
    "invalid_card_id"
  end

  def failure_reason
    "card_number_invalid"
  end

  def outcome
    nil
  end
end

class ResponseHandler
  def self.call(response)
    response.dig(:error, :message) ? ErrorResponse.new : ReservationResponse.new(response)
  end
end



