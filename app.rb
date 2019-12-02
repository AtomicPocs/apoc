# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require 'faraday'
require 'socket'
require 'json'

get '/' do
  json message: "I'm service A"
end

get '/ping' do
  host = Socket.gethostname
  ip = IPSocket.getaddress(host)

  con = Faraday.new
  res = con.get ENV.fetch('ENDPOINT_URL', 'http://localhost:4567/mock')
  data = JSON.parse res.body
  json message: "pong from A [#{ip} (#{host})], #{data['message']}"
end

get '/mock' do
  con = Faraday.new
  res = con.get 'http://www.mocky.io/v2/5de16f5b3200007c448093eb'
  res.body
end
