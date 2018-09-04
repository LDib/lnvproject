# Display a table of the budget and the savings options with timeframes

require_relative 'conversions.rb'
require 'terminal-table'

# def 


# end

def display_budget (budget)

    budget_array = []
    budget_header_array = ['Item', 'Category', 'Amount']
# Get non-negotiables data out of the budget object
# Put that data into the budget array in the right format to be turned into a table

    budget.non_negotiables.each do |key, value|
        value_in_dollars = "$#{Conversions.to_dollars(value)}"
        single_expense = [key, 'non-negotiable', value_in_dollars]
        budget_array << single_expense
    end
    p budget_array
# Get negotiables data out of the budget object
# Put that data into the budget array in the right format to be turned into a table

# Get pay_per_fortnite out of the budget object
# Put that data into the right format to be put into the table

# Get savings goals data out of the budget object
# Put that data into the budget array in the right format to be turned into a table


    rows = [] 
    rows << ['Item', 'Category', 'Amount'] 
    rows << ["Rent", "non-negotiable", "$1000.00"] 
    rows << ["Food", "non-negotiable", "$100.00"]
    table = Terminal::Table.new :rows => rows

    puts table
end