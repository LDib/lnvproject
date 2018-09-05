# This is the budget class that creates a budget object from the user inputs

require_relative 'conversions.rb'

class Budget
    attr_accessor :name, :non_negotiables, :negotiables, :pay_per_fortnight, :savings_goals
    attr_reader :non_negotiables_total, :negotiables_total, :savings_goals_total, :disposable_income

    include Conversions

    def initialize (name, non_negotiables, negotiables, pay_per_fortnight, savings_goals)
        @name = name
        @non_negotiables = convert_hash_to_cents(non_negotiables)
        @negotiables = convert_hash_to_cents(negotiables)
        @pay_per_fortnight = to_cents(pay_per_fortnight)
        @savings_goals = convert_hash_to_cents(savings_goals)
        @non_negotiables_total = sum_hash(@non_negotiables)
        @negotiables_total = sum_hash(@negotiables)
        @savings_goals_total = sum_hash(@savings_goals)
        @disposable_income = @pay_per_fortnight - (@non_negotiables_total + @negotiables_total)
    end

    def sum_hash(hash)
        total = 0
        hash.each_value do |value|
            total += value
        end
        total
    end

    # def calculate_totals
    #     @non_negotiables_total = sum_hash(@non_negotiables)
    #     @negotiables_total = sum_hash(@negotiables)
    #     @savings_goals_total = sum_hash(@savings_goals)
    # end

    # def pay_breakdown
    #     @disposable_income = @pay_per_fortnight - (@non_negotiables_total + @negotiables_total)
    # end


end