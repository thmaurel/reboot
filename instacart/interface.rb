# Define the store as an hash (key: name, value: price)
store = {
  "kiwi" => {price: 1.25, quantity: 5},
  "banana" => {price: 0.5, quantity: 4},
  "mango" => {price: 4, quantity: 1},
  "asparagus" => {price: 9, quantity: 5}
}

# Define the cart as an array (all the items inside)
# cart = []
# STEP2: Update the cart
cart = {}
          # "kiwi" => 3,
          # "mango" => 2

# Print a welcome message
puts "--------------------"
puts "Welcome to Instacart"
puts "--------------------"
# Display what's in the store today
# STEP3: Display the quantity available
puts "In our store today:"
store.each do |product, infos|
  puts "#{product}: #{infos[:price]}€ (#{infos[:quantity]} available)"
end

# Loop until the user wants to quit
answer = ""
until answer == "quit"
  # Ask the user which item he wants to buy
  puts "Which item? (or 'quit' to checkout)"
  # Store his answer into a variable
  answer = gets.chomp # String
  # Add his answer to cart if it's in the store
  # if store[answer]
  # If the answer is included in the keys of store
  # if store.keys.include? answer
  if store.key? answer
    # STEP2: Ask for quantity
    puts "How many?"
    # STEP2: Store his answer into a variable
    quantity = gets.chomp.to_i
    # STEP3: If the quantity asked is available
    if quantity <= store[answer][:quantity]
      # STEP2: Add his answer with quantity into the cart (hash)
      cart[answer] = quantity
    # STEP3: else display an error message
    else
      puts "Sorry there are only #{store[answer][:quantity]} #{answer} left.."
    end
    # cart << answer
  elsif answer != "quit"
  # If it's not in the store, display an error message
    puts "Sorry, we don't have #{answer} today.."
  end
# End the loop
end


# Compute the total price of the cart
bill = 0
# STEP2: Iterate over the hash 'cart' and take into account the quantity
# STEP2: Display for every item the details of the price
# STEP3: Update the computation to read properly the store infos
cart.each do |product, quantity|
  bill += store[product][:price] * quantity
  puts "#{product}: #{quantity} X #{store[product][:price]}€ = #{quantity * store[product][:price]}€"
end

# Display the bill
puts "-------BILL---------"
puts "TOTAL: #{bill}€"
puts "--------------------"
