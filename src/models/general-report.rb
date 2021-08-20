class GeneralReport
  attr_accessor :projects

  def initialize
    @projects = Project.all
  end

  def content
    { count: projects.count, items: items }     
  end

  def items
    projects.map do |project|
      {
        name: project.name, 
        totalTime: "#{project.total_spent_time}m"
      }
    end
  end
end
