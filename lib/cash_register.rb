class CashRegister

  def initialize(apply_discount=false)
    @discount = 20
    @total = 0
    @cart = []
    @prices = []
  end

  attr_accessor :total
  attr_accessor :discount

  def add_item(title, price, quantity=1)
    @total += price * quantity
    i = 1
    while i <= quantity
        @cart << title
    i += 1
    end
    # (@cart << title).times(quantity)
    @prices << price * quantity
  end

  def apply_discount
    if @total == 0
      return "There is no discount to apply."
    else
      @total = @total * 0.8
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    return @cart
  end

  def void_last_transaction
    @total -= @prices.last
  end

end
