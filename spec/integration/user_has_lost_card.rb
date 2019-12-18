require_relative "./../../service.rb"
require 'rspec'
require 'json'


context 'failure scenario' do
  describe 'card id has been reported to be lost' do

    before(:all) do
      service = ReservationService
      card_lost_params =  {
                        card_id: '4000000000009987',
                        amount: 42000,
                        currency: "USD"
                      }
      @response = service.call(card_lost_params)
    end

    it 'returns a ReservationResponse object' do
      expect(@response.class).to eq ReservationResponse
    end

    it 'has a status of declined by network' do
      expect(@response.status).to eq "declined_by_network"
    end

    it 'it has outcome information' do
      expect(@response.outcome).not_to be_empty
    end

    it 'failure reason information says the card is lost' do
      expect(@response.failure_reason).to eq 'lost_card'
    end

  end
end
