class  Task
  attr_accessor :title,:description,:due_date,:completed
  def initialize(title,description,due_date,completed)
    @title=title
    @description=description
    @due_date=due_date
    @completed=completed
  end
end
