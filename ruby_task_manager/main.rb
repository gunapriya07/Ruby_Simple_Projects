require_relative 'task'
require_relative 'task_manager'


task_manager = TaskManager.new

loop do
  puts "\nChoose an option:"
  puts "1. Add Task"
  puts "2. View Tasks"
  puts "3. Mark Task Complete"
  puts "4. Delete Task"
  puts "5. Save Tasks"
  puts "6. Load Tasks"
  puts "7. Exit"
  print "Enter your choice: "

  choice = gets.chomp.to_i

  case choice
  when 1
    task_manager.add_task
  when 2
    task_manager.view_tasks
  when 3
    task_manager.mark_complete
  when 4
    task_manager.delete_task
  when 5
    task_manager.save_to_file
  when 6
    task_manager.load_from_file
  when 7
    puts "Goodbye!"
    break
  else
    puts "Invalid choice. Please try again."
  end
end
