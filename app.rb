# myapp.rb
require 'dotenv/load'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'faraday'

API_HOST            = 'https://api.yelp.com'
SEARCH_PATH         = '/v3/businesses/search'
DEFAULT_TERM        = 'dinner'
DEFAULT_LOCATION    = 'Austin, TX'

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
