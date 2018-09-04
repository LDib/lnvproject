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

    # Checking if there is any disposable income
    if budget.disposable_income < 0
        puts "Please consider reviewing your budget, 
        currently there is no remaining income to put towards your savings goal :("

    # If there is no disposable income display a message to the user advising them so
    else

    # If there is disposable income, calculate how much 25% of the disposable income is
    # Find out how many weeks it would take us to get to the savings goal
    # Divide the savings goal by that figure, to work out the number of weeks it would take
    # Make table row for that info
    percentages_rows = []
    percentages_rows << ["Percentage saved", "Amount per week", "Number of weeks"]


    disposable_per_week = budget.disposable_income / 2.0
    savings_percentages = [0.25, 0.5, 0.75, 1]
    savings_percentages.each do |percentage|

        amount_saved = disposable_per_week * percentage
        no_of_weeks = (budget.savings_goals_total / amount_saved).ceil.to_s
        amount_saved_in_dollars = "$#{Conversions.to_dollars(amount_saved)}"
        percentage_as_string = "#{percentage * 100}%"

        table_row = [percentage_as_string, amount_saved_in_dollars, no_of_weeks]
        percentages_rows << table_row

    end

    percentages_table = Terminal::Table.new :rows => percentages_rows

    puts percentages_table


    # If there is disposable income, calculate how much 50% of the disposable income is
    # Find out how many weeks it would take us to get to the savings goal
    # Divide the savings goal by that figure, to work out the number of weeks it would take
    # Make table row for that info

    # If there is disposable income, calculate how much 75% of the disposable income is
    # Find out how many weeks it would take us to get to the savings goal
    # Divide the savings goal by that figure, to work out the number of weeks it would take
    # Make table row for that info

    # If there is disposable income, calculate how much 100% of the disposable income is
    # Find out how many weeks it would take us to get to the savings goal
    # Divide the savings goal by that figure, to work out the number of weeks it would take
    # Make table row for that info

    end

end

