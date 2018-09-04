require_relative 'budget.rb'
require_relative 'conversions.rb'
require_relative 'interface.rb'
require_relative 'displaybudget.rb'

budget = Budget.new("Vanessa", {"Rent" => 1000, "Food" => 100}, {"Ballet tickets" => 100, "Take-away coffee" => 10}, 1500, 
    {"Holiday to Korea" => 2000})
# budget.calculate_totals

#  p budget.non_negotiables_total
#  p budget.negotiables_total
 
require 'tty-font'
font = TTY::Font.new(:standard)
star_wars_font = TTY::Font.new(:starwars)
puts "========================================================================="
puts ""
puts star_wars_font.write("Carrot")
puts font.write("Budget App")
puts ""
puts "========================================================================="

puts "Welcome to the Carrot Budget App"

while true
    puts "Would you like to open an existing budget (1), create a new budget (2), or exit the budget app (3)?"
    choice = gets.strip.downcase
    case choice
    when "1"
    when "2"
       #budget = get_user_data
       display_budget(budget)
    when "3"
        break
    end
end
