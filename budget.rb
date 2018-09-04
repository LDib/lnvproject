# This is the budget class that creates a budget object from the user inputs

require_relative 'conversions.rb'

class Budget
    attr_accessor :name, :non_negotiables, :negotiables, :pay, :savings_goals

    include Conversions

    def initialize (name, non_negotiables, negotiables, pay, savings_goals)
        @name = name
        @non_negotiables = convert_hash_to_cents(non_negotiables)
        @negotiables = convert_hash_to_cents(negotiables)
        @pay = to_cents(pay)
        @savings_goals = convert_hash_to_cents(savings_goals)
    end



end