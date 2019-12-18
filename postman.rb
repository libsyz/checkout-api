require 'pry-byebug'
require 'httparty'
require 'json'
require 'pp'

# Successful Call

successful_id = 4242424242424242 # tested
insufficient_funds_id =  4000000000009995 #tested
lost_card_id = 4100000000000019 #tested
lost_card_id = 4000000000009987 #tested
invalid_credit_card = 40000007600000


amount = 42
currency = "usd"

BASE_URI = 'http://5df9c4eee9f79e0014b6b2eb.mockapi.io/charge/'

response = HTTParty.post(BASE_URI + "#{invalid_credit_card}",
              {
               card_id: invalid_credit_card,
               currency_id: currency,
               amount: amount
              } )

pp JSON.parse(response.body,
             symbolize_names: true )


