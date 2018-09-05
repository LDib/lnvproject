# Display a table of the budget and the savings options with timeframes

require_relative 'conversions.rb'
require 'terminal-table'


# This method calculates and displays options for how much to save per week to reach the goal
def percentages_table_maker(disposable_income, savings_goals)
    percentages_rows = []
    headings = ["Percentage saved", "Amount per week", "Number of weeks"]


    disposable_per_week = disposable_income / 2.0
    savings_percentages = [0.25, 0.5, 0.75, 1]
    savings_percentages.each do |percentage|

        amount_saved = disposable_per_week * percentage
        # Divide the savings goal by that figure, to work out the number of weeks it would take
        no_of_weeks = (savings_goals / amount_saved).ceil.to_s
        amount_saved_in_dollars = "$#{Conversions.to_dollars(amount_saved)}"
        percentage_as_string = "#{(percentage * 100).to_i}%"
        # Make table row for that info
        table_row = [percentage_as_string, amount_saved_in_dollars, no_of_weeks]
        percentages_rows << table_row

    end
    # Create a table from the rows added in the loop
    percentages_table = Terminal::Table.new :title => "How quick could you reach your goal?", :headings => headings, :rows => percentages_rows
    puts
    # Prints table to the screen
    puts percentages_table
    puts


end

def display_budget (budget)

    budget_rows = []
    headings = ['Item', 'Category', 'Amount']
# Get non-negotiables data out of the budget object
# Put that data into the budget array in the right format to be turned into a table

    budget.non_negotiables.each do |key, value|
        value_in_dollars = "$#{Conversions.to_dollars(value)}"
        table_row = [key, 'Non-negotiable', value_in_dollars]
        budget_rows << table_row
    end

    

# Get negotiables data out of the budget object
# Put that data into the budget array in the right format to be turned into a table

    budget.negotiables.each do |key, value|
        value_in_dollars = "$#{Conversions.to_dollars(value)}"
        table_row = [key, 'Negotiable', value_in_dollars]
        budget_rows << table_row
    end

# Get pay_per_fortnite out of the budget object
# Put that data into the right format to be put into the table

    pay_in_dollars = "$#{Conversions.to_dollars(budget.pay_per_fortnight)}"
    table_row = ['Pay', 'Income', pay_in_dollars]
    budget_rows << table_row

# Get savings goals data out of the budget object
# Put that data into the budget array in the right format to be turned into a table

    budget.savings_goals.each do |key, value|
        value_in_dollars = "$#{Conversions.to_dollars(value)}"
        table_row = [key, 'Savings goal', value_in_dollars]
        budget_rows << table_row
    end

# Create a table from the array of the budget items

    budget_table = Terminal::Table.new :title => "Budget Summary", :headings => headings, :rows => budget_rows

    puts
    puts budget_table
    # Checking if there is any disposable income
    discretionary = budget.pay_per_fortnight - budget.non_negotiables_total
    if budget.negotiables_total >= discretionary
    # If there is no disposable income display a message to the user advising them and directing them to resources
        if discretionary <= 0
            
            puts "It seems that your basic living expenses are more than your pay."
            puts "Consider calling the National Debt Helpline on 1800 007 007"
            puts
            puts "OR"
            puts
            puts "Have a look at ASIC's Money Smart website"
            puts "Would you like to go visit this site now? y/n"
            choice = gets.strip
                if choice == 'y'
                    system ("open https://www.moneysmart.gov.au/managing-your-money/managing-debts/financial-counselling")
                end
            puts
        else 
            puts
            puts "Please consider reviewing your budget." 
            puts "Currently there is no remaining income to put towards your savings goal :("
            # present a percentage of negotiables to reduce by in order to keep expenses lower than income
            overspend = budget.negotiables_total - discretionary
            puts "You need to reduce your non-crucial spending by $#{Conversions.to_dollars(overspend)}"
            puts    
        end
    else
    
    percentages_table_maker(budget.disposable_income, budget.savings_goals_total)

    puts "Now you can see how quickly you can reach your goals just by saving your disposable income."
    puts

    while true
        puts "Would you like to see how you could get there even quicker by cutting your negotiable expenses? y/n"
        choice = gets.strip
        if choice == 'y'
            # Get the input percentage
            puts "By what percentage could you cut your negotiable expenses?: "
            input_percentage = gets.strip.to_i
            # run the numbers with that percentage
            new_negotiables = budget.negotiables_total * (1 - input_percentage/100.00)
            new_disposable = budget.pay_per_fortnight - (budget.non_negotiables_total + new_negotiables)
            percentages_table_maker(new_disposable, budget.savings_goals_total)
        else
            puts
            puts "You now have your timeframe to achieve your goals, go get that carrot!"
            sleep 1
            
            puts """
             \\     /
             \\\\   //
              )\\-/(
              /e e\\
             ( =Y= )
             /`-!-'\\
        ____/ /___\\ \\
   \\   /    ```    ```~~\\\"--.,_
`-\._\\ /                       `~~\"--.,_
----->|                                `~~\"--.,_
_\.-'/ \                                         ~~\"--.,_
   /jgs\_________________________,,,,....----\"\"\"\"~~~~````

"""
            puts

            break
        end 
    end

    end

end

