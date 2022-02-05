# interface.rb

# STEP2: Define the gift list (as an array)
# Display a welcome message
puts "Welcome to your Christmas gift list"
# Loop until the user wants to quit
answer = ""
until answer == "quit"
  # Ask the user which action he wants to perform
  puts "Which action [list|add|delete|quit]?"
  # Store his answer into a variable
  answer = gets.chomp
  # Depending on the answer, print a message of the action to perform
  case answer
  when "list"
    # puts "TODO: list items"
    # STEP2: Iterate over the gift list to print every single gift
  when "add"
    puts "TODO: add item"
  when "delete"
    puts "TODO: delete item"
  when "quit"
    puts "Goodbye"
  end
# End the loop
end
# (Print Goodbye)
