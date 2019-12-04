# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require 'faraday'
require 'socket'
require 'json'

SERVICE_NAME = 'A'

get '/' do
  json message: "I'm service #{SERVICE_NAME}"
end

get '/ping' do
  host = Socket.gethostname
  ip = IPSocket.getaddress(host)

  con = Faraday.new
  res = con.get ENV.fetch('ENDPOINT_URL', 'http://localhost:4567/mock')
  data = JSON.parse res.body
  json message: "pong from #{SERVICE_NAME} [#{ip} (#{host})], #{data['message']}"
end

get '/timeout' do
  sleep 5
  json message: "Waked up"
end

get '/mock' do
  con = Faraday.new
  res = con.get 'http://www.mocky.io/v2/5de16f5b3200007c448093eb'
  res.body
end
