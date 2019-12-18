require 'pry-byebug'
require 'httparty'
require 'json'
require 'pp'

# Successful Call

valid_card_id = 4242424242424242
amount = 42
currency = "usd"

BASE_URI = 'http://5df9c4eee9f79e0014b6b2eb.mockapi.io/charge/'

response = HTTParty.post(BASE_URI + "#{valid_card_id}",
              {
               card_id: valid_card_id,
               currency_id: currency,
               amount: amount
              } )

pp JSON.parse(response.body,
             symbolize_names: true )


