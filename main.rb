require_relative 'budget.rb'
require_relative 'conversions.rb'
require_relative 'interface.rb'
require_relative 'displaybudget.rb'

# This budget object is for testing the outputs without having to enter an entire budget each time
# To use this for testing comment out #budget = get_user_data (on line 33) and comment in the below line (8)

#  budget = Budget.new("Vanessa", {"Rent" => 1000, "Food" => 100}, {"Ballet tickets" => 100, "Take-away coffee" => 10}, 1200, {"Holiday to Korea" => 2000})
 
require 'tty-font'
font = TTY::Font.new(:standard)
star_wars_font = TTY::Font.new(:starwars)
puts "========================================================================="
puts ""
puts star_wars_font.write("Carrot")
puts font.write("Budget App")
puts ""
puts "========================================================================="
puts
sleep 1
puts "Welcome to the Carrot Budget App!"
puts ""
puts "This app will help you make a plan to get your carrot (savings goal)."
puts
puts "We will start by gathering the below data:"
puts "- Your basic living expenses (those things that just have to be paid)"
puts "- The negotiable expenses in your life (those things that are nice to have)"
puts "- Something that you are saving towards"
puts 
puts "We'll then give you an idea of how fast you could get there!"
puts
while true
    puts "Would you like to create a new budget (1), or exit the budget app (2)?"
    choice = gets.strip.downcase
    case choice
    when "1"
       budget = get_user_data
       display_budget(budget)
    when "2"
        break
    end
end
puts
puts "Thanks for using the Carrot Budget App!"
puts
puts "Created by Laurence & Vanessa @ CoderAcademy"
puts
