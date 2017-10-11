class CashRegister

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_item_price= 0
  end

  attr_accessor :discount, :total

  def add_item(name, price, quantity=1)
    @total += price * quantity
    i=0
    while i < quantity
      @items << name
      i += 1
    end
    @last_item_price = price
  end

  def apply_discount
    @total = @total - (@total * @discount /100)
    if @discount !=0
      return  "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_item_price
  end

end
