require 'sinatra'
require "sinatra/activerecord"
require "./src/models/project.rb"
require "./src/models/time_segment.rb"
require 'byebug'

set :database, { adapter: "sqlite3", database: "time-tracker.sqlite3" }


get '/home' do
  'Hello World!!'
end
