        # User interface for budget app

        

    def get_user_data
        require_relative 'budget.rb'
        require_relative 'conversions.rb'


        puts "What is your name?"
        name = gets.strip.downcase

        def get_data_into_a_hash(hash)
            while true
                # name
                puts "What is the name of the item?"
                expense_name = gets.strip
                # amount
                puts "What is the amount?"
                amount = gets.to_f
                # time
                puts "Is this paid monthly, fortnightly, or yearly?"
                time_period = gets.strip
                # turn the expense into a fortnightly one
                case time_period
                when "monthly"
                    amount = amount/2.0
                when "yearly"
                    amount = amount/24.0
                end
                # add this expense to the non_negotiables hash
                hash[expense_name] = amount
                p hash
                puts "Have you got anything else to add? y/n"
                choice = gets.strip
                if choice == "n"
                    break
                end
            end
        end
        # gather inputs for non-negotiable items and hold them in a hash
        puts "First we will ask you for the things throughout the year that simply must be paid."
        puts "For example, you may include rent in this category, which could be $1000 per month."
        non_negotiables = Hash.new
        get_data_into_a_hash(non_negotiables)

        # gather inputs for negotiable items and hold them in a hash
        puts "Next we will ask you for the expenses that make life not suck."
        puts "An example might be eating out with friends, or going to see a movie."
        negotiables = Hash.new
        get_data_into_a_hash(negotiables)
        # gather pay data

        puts "Next we will ask you how much you get paid."
        puts "Please enter this as a fortnightly figure:"
        pay_per_fortnight = gets.strip.to_f

        while pay_per_fortnight <= 0
            puts "Please enter an amount greater than 0"
            pay_per_fortnight = gets.strip.to_f
        end

        

        # gather savings goals and hold them in a hash
        puts "Now we want to know what exciting dreams you want to save for."
        puts "You can enter more than one if you wish."
        savings_goals = Hash.new
        while true
            puts "What is your exciting savings goal?"
            goal = gets.strip
            puts "How much will this wonderful dream cost you?"
            amount = gets.strip.to_f
            savings_goals[goal] = amount
            puts "Do you have another goal you would like to add? y/n"
            choice = gets.strip
            if choice == "n"
                break
            end
        end

        # create a Budget object using the above data
        budget = Budget.new(name, non_negotiables, negotiables, pay_per_fortnight, savings_goals)
    end