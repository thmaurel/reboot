# Define an array with the horses names
horses = ['Ruby', 'Code', 'Diamond', 'Silver']
# STEP2: Add a balance variable
balance = 100
replay = 'Y'
# STEP2: Loop while the user has enough money (until the user has no money)
while balance >= 10 && replay == 'Y'
# until balance <= 0 || replay == 'N'
  # Display all the horses
  puts "Voici les chevaux:"
  horses.each_with_index do |horse, index|
    puts "#{index + 1} - #{horse}"
  end
  # Take randomly a winner
  winner = horses.sample
  p winner
  # Ask the user on which horse he wants to bet
  puts "Choisis un cheval!"
  # Store his answer into a variable
  answer = gets.chomp
  # Display the winner
  # Compare the bet with the winner to tell the user if he won
  # (if statement)
  if winner == answer
    puts "T'as gagné ! Le gagnant est #{winner}!"
    # STEP2: Add 50 to the user balance
    balance += 50
  else
    puts "T'as perdu ! Le gagnant est #{winner}!"
    # STEP2: Remove 10 from the user balance
    balance -= 10
  end
  # STEP2: Display the user balance
  puts "Il vous reste #{balance} crédits!"
  puts "Voulez vous rejouer ?"
  replay = gets.chomp
# STEP2: End the loop
end
