class Project < ActiveRecord::Base
  has_many :time_segments

  def time_segment
    time_segments.where(current: true).first || TimeSegment.new(project_id: self.id, current: true)
  end

  def total_spent_time
    time_segments.where(current: false).map(&:duration).inject(:+)
  end
end
