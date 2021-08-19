class Project < ActiveRecord::Base
  has_many :time_segments
end
