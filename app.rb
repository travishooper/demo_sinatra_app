# myapp.rb
require 'sinatra'
require "sinatra/reloader"
require 'faraday'

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path


DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 5

get '/' do
  url = "#{API_HOST}#{SEARCH_PATH}"

  resp = Faraday.get(url) do |req|
    req.params['term'] = params[:term] || DEFAULT_TERM
    req.params['location'] = params[:location] || DEFAULT_LOCATION
    req.headers['Content-Type'] = 'application/json'
    req.headers['Authorization'] = "Bearer #{ENV['API_KEY']}"
  end

  resp.body
end

get '/new_route' do
  { message: "NEW ROUTE #{params['fooobaaar']}" }.to_json
end

get '/new_route/:id' do
  { message: "NEW ROUTE WITH ID of: #{params['id']}" }.to_json
end
