require_relative "./../../service.rb"
require 'rspec'
require 'json'


context 'failure scenario' do
  describe 'call to service activates fraud detection' do

    before(:all) do
      service = ReservationService
      fraud_params =  {
                        card_id: '4100000000000019',
                        amount: 42000,
                        currency: "USD"
                      }
      @response = service.call(fraud_params)
    end

    it 'returns a ReservationResponse object' do
      expect(@response.class).to eq ReservationResponse
    end

    it 'has a status of declined by network' do
      expect(@response.status).to eq "blocked"
    end

    it 'it has outcome information' do
      expect(@response.outcome).not_to be_empty
    end

    it 'failure resons says risk is too high' do
      expect(@response.failure_reason).to eq 'highest_risk_level'
    end

  end
end
