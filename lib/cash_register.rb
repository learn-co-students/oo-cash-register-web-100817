require 'pry'

class CashRegister

  attr_accessor :total, :discount


   def initialize(discount=0)
     @total = 0
     @discount = discount
     @items = []
     @all_prices = []
   end

   def add_item(title, price, count=1)
     @title = title
     @price = price
     @count = count
     @count.times do
        @items << @title
      end
     @total += @price * @count
     @all_prices << @count * @price
   end

   def apply_discount
     if @discount == 0
       "There is no discount to apply."
      else
        @total -= @total * @discount.to_f/100
        "After the discount, the total comes to $#{@total.to_i}."
      end
   end

  #  def last_transaction
  #    @last_transaction = {
  #      @title => @price * @count
  #    }
  #  end

   def void_last_transaction
     @total = @total - @all_prices[-1]
   end

   def items
     @items
   end

end

# new_register = CashRegister.new
# new_register.add_item(title, price, count)
