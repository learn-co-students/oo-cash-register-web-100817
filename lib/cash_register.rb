
require 'pry'

class CashRegister
  attr_reader :total
  attr_writer :total
  attr_accessor :discount, :total, :items, :food_key

  def initialize(discount=20)
    @total = 0
    @discount = discount
    @items = []
    @food_key = {}
  end

  def add_item(title, price, quantity=1)
      i = 0
    while i < quantity
      @items << title
      i+=1
    end


    @total += (price * quantity)

  @items.each do |title|
    @food_key[title] = price
  end
end


  def apply_discount

    @total = @total.to_f - (@total.to_f*(@discount.to_f/100.to_f))
    @before_discount = @total + (@total.to_f*(@discount.to_f/100.to_f))
    # binding.pry

      if @total == @before_discount
        "There is no discount to apply."
      else
        "After the discount, the total comes to $#{@total.to_i}."
      end
  end

def void_last_transaction
@total = @total - @food_key[@items[-1]]
# binding.pry
end

end
