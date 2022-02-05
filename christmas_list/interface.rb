# interface.rb
require_relative 'christmas'

# STEP2: Define the gift list (as an array)
# gift_list = [
#   "sockets",
#   "ruby book",
#   "macbook pro"
# ]

# STEP5: Update our gift_list variable
gift_list =[
  { name: "sockets", bought: false },
  { name: "ruby book", bought: true},
  { name: "macbook pro", bought: false }
]


# Display a welcome message
puts "Welcome to your Christmas gift list"
# Loop until the user wants to quit
answer = ""
until answer == "quit"
  # Ask the user which action he wants to perform
  puts "Which action [list|add|delete|mark|idea|quit]?"
  # Store his answer into a variable
  answer = gets.chomp
  # Depending on the answer, print a message of the action to perform
  case answer
  when "list"
    list(gift_list)
  when "add"
    add(gift_list)
  when "delete"
    delete(gift_list)
  # STEP 5.5: Add a new case to mark a gift as bought
  when "mark"
    mark(gift_list)
  when "quit"
    puts "Goodbye"
  when "idea"
    idea(gift_list)
  end
# End the loop
end
# (Print Goodbye)
