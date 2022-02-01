require_relative 'calculator'

# STEP2: Initialize the answer variable to enter the loop
answer = "Y"
# STEP2: Loop while the user wants to calculate
while answer == "Y" || answer == "yes"
#until answer == "N"
  # Ask user for the first number
  puts "Enter a first number:"
  # Get the answer from the user and store it into a variable
  number_1 = gets.chomp.to_i
  # Ask user for the second number
  puts "Enter a second number:"
  # Get the answer from the user and store it into another variable
  number_2 = gets.chomp.to_i
  # Ask the user which operation he wants to do
  puts "Choose operation [+][-][*][/]"
  # Get the answer from the user and store it into a third variable
  operator = gets.chomp
  # Display the result
  puts calculate(number_1, number_2, operator)
  # STEP2: Ask the user if he wants to keep calculating
  puts "Do you want to calculate again? [Y/N]"
  # STEP2: Store his answer into a variable
  answer = gets.chomp
# STEP2: Loop ends
end
