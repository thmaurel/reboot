# christmas.rb
require 'open-uri'
require 'nokogiri'

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


def idea(gift_list)
  # Ask the user what he wants to look for
  puts "What are you looking for on Etsy?"
  # Store his answer into a variable
  idea = gets.chomp
  # Display introduction text for results
  puts "Here are Etsy results for \"#{idea}\":"
  # Generate the url based on his idea
  url = "https://www.etsy.com/fr/search?q=#{idea}"
  # Open the URL & read it
  html_content = URI.open(url).read
  # Parse with Nokogiri the html
  doc = Nokogiri::HTML(html_content)
  suggestions = []
  # Take the first 4 suggestions displayed
  doc.search('.v2-listing-card__title').first(4).each do |element|
    # Push them inside an array
    suggestions << element.text.strip
  end
  # Display the 4 suggestions
  suggestions.each_with_index do |suggestion, index|
    puts "#{index + 1} - #{suggestion}"
  end
  # Ask the user which one he wants to add to his gift list
  puts "Pick one to add to your list (give the number)"
  # Store his answer into a variable
  index_to_add = gets.chomp.to_i - 1
  # Find the associated idea
  item_to_add = suggestions[index_to_add]
  # Add it to the gift list
  gift_list << {name: item_to_add, bought: false}
  # Display a confirmation text
  puts "\"#{item_to_add}\" added to your wishlist"
end
