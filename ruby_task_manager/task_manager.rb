require_relative 'task'

class TaskManager
  def initialize
    @tasks=[]
  end

  def add_task
    puts "Enter the title:"
    title=gets.chomp
    puts "Enter the description:"
    description=gets.chomp
    puts "Enter the due date:"
    date=gets.chomp
    task=Task.new(title,description,date,false)
    @tasks<<task
    puts "Task added succesfully!"
  end

  def view_tasks
    if @tasks.empty?
      puts "No tasks found!"
    else
      @tasks.each_with_index do |task,index|
         status =task.completed ? "Completed":"Pending"
         puts "#{index+1}.#{task.title}-#{task.description}(Due: #{task.due_date} [#{status}])"
      end

    end

  end

  def mark_complete
    if @tasks.empty?
      puts "No tasks:"
    else
       puts 'Enter the tasks number to mark as complete:'
       index=gets.chomp.to_i
      #  @tasks[index-1].completed=true
      if index.between?(1,@tasks.length)
        @tasks[index-1].completed=true
        puts "Task marked as completed!"
      else
        puts "Invalid task number."
      end
    end
  end

  def delete_task
    if @tasks.empty?
       puts "No tasks is available!"
    else
      view_tasks
      puts "Enter the number of tasks you need to delete:"
      index=gets.chomp.to_i
      if index.between?(1,@tasks.length) 
         deleted=@tasks.delete_at(index-1)
         puts "Deleted task: #{delete.title}"
      else
        puts "Not found..!"
      end
    end
  end

  def load_from_file
    if File.exist?("tasks.json")
      file_content=File.read("tasks.json")
      data=Json.parse(file_content)

      @tasks=data.map do |task_hash|
        Task.new(
        task_hash["title"],
        task_hash["description"],
        task_hash["due_date"],
        task_hash["completed"]
      )
    end
    puts "Tasks loaded successfully!"
    else
      puts "Not found the tasks.json file"
    end
  end

 def save_to_file
  data = @tasks.map do |task|
    {
      title: task.title,
      description: task.description,
      due_date: task.due_date,
      completed: task.completed
    }
  end

  json_data = JSON.pretty_generate(data)
  File.write("tasks.json", json_data)

  puts "Tasks saved successfully!"
end
end