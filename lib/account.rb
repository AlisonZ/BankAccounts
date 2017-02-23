#this is the new, second try at this
require "csv"

module Bank

    class Account
        attr_accessor :id, :balance, :opendate
        def initialize (id, balance, opendate = nil)
            raise ArgumentError.new("You need some positive cash flow to open an account") if balance < 0
            @id = id
            @balance = balance
            @opendate
        end


        def self.all
            accounts = []

            CSV.read("support/accounts.csv").each do |line|
                id = line[0].to_i
                balance = line[1].to_i
                opendate = line[2]
                account = Bank::Account.new(id, balance, opendate)
                accounts << account
            end
            return accounts
        end


        def withdraw (amount)
            if amount > 0
                if @balance - amount < 0
                    puts "You do not have enough money to withdraw this amount"
                else
                    @balance -=amount
                end
            else
                raise ArgumentError.new("You can only withdraw a positive amount of money")
            end
            return @balance
        end


        def deposit (amount)
            if amount > 0
                @balance +=amount
                return @balance
            else
                raise ArgumentError.new("need positive amt")
            end

        end


        def show_balance
            return @balance
        end

    end
end


# my_account = Bank::Account.new(16, 1000)
# puts my_account.show_balance
# puts my_account.withdraw(1200)
# puts my_account.deposit(200)