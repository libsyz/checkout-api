

class ReservationResponse
  attr_reader :status, :failure_reason, :outcome
  def initialize(response_json)
    @status = "some"
    @failure_reason = "none"
    @outcome = "success"
  end

end
