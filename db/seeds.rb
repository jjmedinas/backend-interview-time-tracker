require File.expand_path("../../src/models/project", __FILE__)
require File.expand_path("../../src/models/time_segment", __FILE__)
require 'time'
require 'byebug'


projects = []
projects_data = [
  { name: 'Backend Interview', identifier: 'backend-interview' },
  { name: 'Meaningful work', identifier: 'procrastinate' }
]
time_segments = [
  { started_at: Time.now - 1*60*60, stopped_at: Time.now + 1*60*60, current: false },
  { started_at: Time.now - 4*60*60, stopped_at: Time.now + 2*60*60, current: false },
  { started_at: Time.now - 12*60*60, current: true }
]

projects_data.each do |p|
  projects.push(Project.create(p))
end

projects.each do |project| 
  time_segments.each do |ts_data|
    ts = TimeSegment.new(ts_data)
    ts.project = project
    ts.save
  end
end

puts "Success!"
