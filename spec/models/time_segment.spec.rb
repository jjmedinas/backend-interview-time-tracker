require "spec_helper"
require "sinatra/activerecord"
require File.expand_path("../../../src/models/project", __FILE__)
require File.expand_path("../../../src/models/time_segment", __FILE__)

describe "TimeSegment" do
  let(:project) { Project.create(name: 'Awesome Project', identifier: 'awesome-project') }
  let(:time_segment_attributes) {{ project_id: project.id, current: true }}
  let(:time_segment) { TimeSegment.new(time_segment_attributes) }

  before(:all) do
    DatabaseCleaner.clean
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  describe "#start!" do 
    context "when time_segment hasn't been started before" do
      it "sets start_at with current date time" do
        expect(time_segment.started_at).to be_nil

        time_segment.start!

        expect(time_segment.started_at).not_to be_nil
      end
    end

    context "when time_segment has already been started" do
      it "sets start_at with current date time" do
        time_segment.started_at = Time.now - 1*60*60 
        expect(time_segment.started_at).to be_present

        expect { time_segment.start!}.to raise_error(StandardError, include("The time segment was already started"))
      end
    end
  end
end
