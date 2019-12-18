
require 'json'
require 'sinatra'


  get '/' do
    "welcome to Sinatra"
  end


  post '/checkout/' do
    puts [:params]
  end


