
class ReservationResponse
  attr_reader :status, :outcome, :failure_reason

  def initialize(response)
    @status = response[:status] || response.dig(:outcome, :network_status)
    @outcome = response[:outcome]
    @failure_reason = response.dig(:outcome, :reason)
  end

end


