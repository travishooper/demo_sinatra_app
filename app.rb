# myapp.rb
require 'sinatra'
require "sinatra/reloader"

get '/' do
  { message: 'I AM A SERVER' }.to_json
end

get '/new_route' do
  { message: "NEW ROUTE #{params['fooobaaar']}" }.to_json
end

get '/new_route/:id' do
  { message: "NEW ROUTE WITH ID of: #{params['id']}" }.to_json
end
