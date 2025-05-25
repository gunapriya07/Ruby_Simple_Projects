
def add_note
  note=gets.chomp
  File.open("notes.txt",'a') {|f| f.puts note}
  puts "Saved..!"
end

def view_notes
   if File.exist?("notes.txt")
      puts File.read("notes.txt")
   else
      puts "You file not found..!"
   end
end

loop do 
  puts "\n1.Add note\n2.View Note\n3.Exit"
  choice=gets.chomp
  case choice
   when "1"
       add_note
    when "2"
        view_notes
    when "3"
        puts "You exited the program" 
        break
    else
        puts "Enter the correct option:"
    end  
end