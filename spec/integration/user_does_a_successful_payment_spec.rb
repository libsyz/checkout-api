require_relative "./../../service.rb"
require 'rspec'
require 'json'


context 'success scenario' do
  describe 'successful reservation with valid parameters' do

    let(:service) { ReservationService }
    let(:valid_params) {
                         {
                          card_id: '4242424242424242',
                          amount: 42,
                          currency: "USD"
                         }
                        }

    it 'returns a response object' do
      response = service.call(valid_params)
      expect(response.class).to eq ReservationResponse
    end

    it 'the response object has a success status' do
      response = service.call(valid_params)
      expect(response.status).to eq "succeeded"
    end

    it 'the response object stores outcome info' do
      response = service.call(valid_params)
      expect(response.outcome).not_to be_empty
    end

    it 'the response object responds nil to failure reason' do
      response = service.call(valid_params)
      expect(response.failure_reason).to eq nil
    end

  end
end
