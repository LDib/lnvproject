# Creating a module to convert figures to cents for calculations, and then back to dollars for presentation


module Conversions

    def to_cents (amount)
        amount * 100
    end

    def self.to_dollars (amount)
        '%.2f' % (amount/100.00)
    end

    def convert_hash_to_cents (hash)
        hash.each do |key, value|
            hash[key] = to_cents(value)
        end
        hash
    end

    def convert_to_percent ()

    end
end