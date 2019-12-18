
require_relative '../../service.rb'
require 'rspec'
require 'json'
require 'pry-byebug'

context 'failure' do
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


describe "user performs a call with invalid params" do
  subject { Service }




end
  #     expect { Service.call({}) }.to raise_error(Service::MissingParamsError)


#   it 'returns a successful charge with the relevant payment details' do
#     result = subject.(params)

#     expect(result.success?).to be_truthy
#     expect(result.transaction_id).to eq ''
#     expect(result.failure_reason).to eq nil
#   end

#   it 'returns true when the request is valid' do
#     params =
#     expect { Service.call(params)}.to be_truthy
#   end

#   context 'payment declined' do
#     let(:card_id) {  }

#     it 'returns a failed charge with payment declined reason' do
#       result = subject.(params)

#       expect(result.success?).to be_falsy
#       expect(result.failure_reason).to be eq ''
#     end
#   end

#   context 'invalid PAN number' do

#   end
# end

