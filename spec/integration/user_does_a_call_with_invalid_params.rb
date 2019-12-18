
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
      it "returns an error message" do
        response = JSON.parse(service.call, symbolize_names: true)
        expect(response[:error][:message]).to eq "Invalid request parameters"
        expect(response[:error][:type]).to eq "Invalid request error"
      end
    end

    describe "call without amount" do
      it "returns an error message" do
        params = {card_id: valid_card, currency: valid_currency }
        response = JSON.parse(service.call,
                              symbolize_names: true)

        expect(response[:error][:message]).to eq "Invalid request parameters"
        expect(response[:error][:type]).to eq "Invalid request error"
      end
    end

    describe "call without currency" do
      it "returns an error message" do
        params = {card_id: valid_card, amount: valid_amount }

        response = JSON.parse(service.call,
                              symbolize_names: true)
        expect(response[:error][:message]).to eq "Invalid request parameters"
        expect(response[:error][:type]).to eq "Invalid request error"
      end
    end

    describe "call without credit card number" do
      it "returns an error message" do
        params = {amount: valid_amount, currency: valid_currency }

        response = JSON.parse(service.call,
                              symbolize_names: true)
        expect(response[:error][:message]).to eq "Invalid request parameters"
        expect(response[:error][:type]).to eq "Invalid request error"
      end
    end
  end
end

