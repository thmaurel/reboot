# interface.rb
require_relative 'christmas'
require 'open-uri'
require 'nokogiri'

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
    puts "What are you looking for on Etsy?"
    idea = gets.chomp
    puts "Here are Etsy results for \"#{idea}\":"
    url = "https://www.etsy.com/fr/search?q=#{idea}"
    html_content = URI.open(url).read
    doc = Nokogiri::HTML(html_content)
    suggestions = []
    doc.search('.v2-listing-card__title').first(4).each do |element|
      suggestions << element.text.strip
    end
    suggestions.each_with_index do |suggestion, index|
      puts "#{index + 1} - #{suggestion}"
    end
    puts "Pick one to add to your list (give the number)"
    index_to_add = gets.chomp.to_i - 1
    item_to_add = suggestions[index_to_add]
    gift_list << {name: item_to_add, bought: false}
    puts "\"#{item_to_add}\" added to your wishlist"
  end
# End the loop
end
# (Print Goodbye)
