require_relative "./../../service.rb"
require 'rspec'
require 'json'


context 'failure scenario' do
  describe 'card id is invalid' do

    before(:all) do
      service = ReservationService
      invalid_card_params =  {
                        card_id: '40000007600000',
                        amount: 42000,
                        currency: "USD"
                      }
      @response = service.call(invalid_card_params)
    end

    it 'returns a ErrorResponse object' do
      expect(@response.class).to eq ErrorResponse
    end

    it 'has a status of invalid card id' do
      expect(@response.status).to eq "invalid_card_id"
    end

    it 'has no outcome information but responds to the method' do
      expect(@response.outcome).to eq nil
    end

    it 'failure reason information says the card is invalid' do
      expect(@response.failure_reason).to eq 'card_number_invalid'
    end

  end
end
