


class CashRegister
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @basket = []
  end



  def add_item(name, price, q = 1)
    @last_item = price
    counter = 0
    while counter < q do
      @basket << name
      counter += 1
    end

    @total += price * q

  end


  def items
    return @basket
  end

  def void_last_transaction
    @total -= @last_item
    @basket.pop
  end

  def apply_discount
    if @discount == 0

      return "There is no discount to apply."
    end

    @total -= @total*(discount.to_f/100.0)

    @total = @total.to_i
    return "After the discount, the total comes to $#{@total}."
  end

  attr_accessor :total, :discount, :basket



end
