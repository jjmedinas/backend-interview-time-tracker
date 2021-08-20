class SingleProjectReport
  attr_accessor :project, :segments
  
  def initialize(project)
    @project = project
    @segments = project.time_segments.where(current: false)
  end

  def content
    { 
      count: segments.count,
      total_spent_time: "#{project.total_spent_time} minutes",
      items: items
    }
  end

  def items
    segments.map do |segment|
      {
        id: segment.id,
        duration: "#{segment.duration}m"
      }
    end
  end
end
