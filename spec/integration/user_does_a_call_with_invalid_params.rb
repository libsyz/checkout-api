
require_relative "./../../service.rb"
require 'rspec'
require 'json'

context 'failure scenario' do
  context "service calls with incomplete params" do

    let(:service) { ReservationService }
    let(:valid_card) { '4242424242424242' }
    let(:valid_amount) { 45.00 }
    let(:valid_currency) { 'USD' }

    describe "call without any params" do
      it "returns an error request object" do
        response = service.call
        expect(response.class).to eq ErrorResponse
      end
    end

    describe "call without amount" do
      it "returns an error object with an error message" do
        params = {card_id: valid_card, currency: valid_currency }
        response = service.call(params)

        expect(response.status).to eq "request_invalid"
        expect(response.failure_reason).to eq "invalid_params"
      end
    end

    describe "call without currency" do
      it "returns an error message" do
        params = {card_id: valid_card, amount: valid_amount }
        response = service.call(params)

        expect(response.status).to eq "request_invalid"
        expect(response.failure_reason).to eq "invalid_params"
      end
    end

    describe "call without credit card number" do
      it "returns an error message" do
        params = {amount: valid_amount, currency: valid_currency }

        response = service.call(params)
        expect(response.status).to eq "request_invalid"
        expect(response.failure_reason).to eq "invalid_params"
      end
    end
  end
end

