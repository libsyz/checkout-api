require_relative "./../../service.rb"
require 'rspec'
require 'json'


context 'failure scenario' do
  describe 'account does not have funds to make reservation' do

    before(:all) do
      service = ReservationService
      no_funds_params =  {
                          card_id: '4000000000009995',
                          amount: 42000,
                          currency: "USD"
                         }
      @response = service.call(no_funds_params)
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

    it 'outcome information says there are insufficient funds' do
      expect(@response.failure_reason).to eq 'insufficient_funds'
    end

  end
end
