# christmas.rb

# STEP2.5: Refacto the list action into a method
# STEP5: Update the list method to display the gift name & if it was bought or not
def list(gift_list)
  # STEP2: Iterate over the gift list to print every single gift
  gift_list.each_with_index do |gift, index|
    cross = gift[:bought] ? "X" : " "
    puts "#{index + 1} - [#{cross}] #{gift[:name]}"
  end
end

# STEP3.5: Refacto the add action into a method
def add(gift_list)
  # STEP3: Ask the user which gift he wants to add
  puts "Which gift do you want to add?"
  # STEP3: Store his answer into a variable
  add = gets.chomp
  # STEP3: Add the new gift to our gift_list
  # STEP5: Update what we push inside the gift list to make it a hash (and by default bought: false)
  gift_list << { name: add, bought: false }
end

# STEP4.5: Refacto the delete action into a method
def delete(gift_list)
  # STEP4: Ask the user what he wants to delete (index)
  puts "Which item do you want to delete? (give number)"
  # STEP4: Store his answer into a variable
  index_to_delete = gets.chomp.to_i - 1
  # STEP4: Delete his answer from the gift list
  gift_list.delete_at(index_to_delete)
end

# STEP 5.5: Refacto the mark action into a method
def mark(gift_list)
  # STEP 5.5: Ask the user which item he bought (index)
  puts "Which item have you bought (give the index)?"
  # STEP 5.5: Store his answer into a variable
  index_mark = gets.chomp.to_i - 1
  # STEP 5.5: Update our gift list to take his answer into account
  gift_list[index_mark][:bought] = true
end
