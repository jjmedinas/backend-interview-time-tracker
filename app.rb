require 'sinatra'
require "sinatra/activerecord"
require "./src/models/project.rb"
require "./src/models/time_segment.rb"
require 'byebug'

set :port, ENV.fetch('HTTP_PORT', 3000).to_i
set :bind, '0.0.0.0'


before '*/projects/:id/*' do
  @project = Project.find(params[:id])
rescue ActiveRecord::RecordNotFound => e
  halt 404, "Project not found"
end

post '/projects/:id/time-segments/start' do
  # time_segment = @project.time_segment
end

post '/projects/:id/time-segments/stop' do
end

get '/reports/projects' do
end


get '/reports/projects/:id' do
end
