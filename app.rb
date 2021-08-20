require 'sinatra'
require "sinatra/activerecord"
require "./src/models/project.rb"
require "./src/models/time_segment.rb"
require "./src/models/general-report.rb"
require "./src/models/single-project-report.rb"
require 'byebug'

set :port, ENV.fetch('HTTP_PORT', 3000).to_i
set :bind, '0.0.0.0'


['/reports/projects/:id', '/projects/:id/*'].each do |route|
  before route do
    content_type 'application/json'
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    halt 404, "Project not found"
  end
end

post '/projects/:id/time-segments/start' do
  time_segment = @project.time_segment
  time_segment.start!

  200
rescue => e
  [400, map_error_response(e.message)]
end

post '/projects/:id/time-segments/stop' do
  time_segment = @project.time_segment
  time_segment.stop!

  200
rescue => e
  [400, map_error_response(e.message)]
end

get '/reports/projects' do
  report = GeneralReport.new

  [200, report.content.to_json]
rescue => e
  [400, map_error_response(e.message)]
end


get '/reports/projects/:id' do
  single_report = SingleProjectReport.new(@project)

  [200, single_report.content.to_json]
rescue => e
  [400, map_error_response(e.message)]
end


def map_error_response(message)
  { error: message }.to_json
end
