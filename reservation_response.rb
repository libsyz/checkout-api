
class ReservationResponse
  attr_reader :status, :outcome

  def initialize(response)
    @status = response[:status]
    @outcome = response[:outcome]
  end

  def failure_reason
    nil
  end

end


