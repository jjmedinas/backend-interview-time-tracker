require 'sinatra'
require "sinatra/activerecord"

set :database, { adapter: "sqlite3", database: "time-tracker.sqlite3" }


get '/home' do
  'Hello World!!'
end
