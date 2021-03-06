require_relative 'account.rb'

module Bank
    class SavingsAccount < Account
        def initialize (id, balance, opendate = nil)
            super
            # @fee = 2
            # @minimum = 10
            raise ArgumentError.new("You must have at least $10") if balance < 10
        end


        def fee
            2
        end

        def minimum
            10
        end


        def add_interest(rate)
            if rate > 0
                interest = @balance * rate/100
                @balance += interest
                return interest
            else
                puts "Rate must be a positive amount"
            end
        end

    end
end
