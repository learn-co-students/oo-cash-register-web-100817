class CashRegister
  attr_accessor :discount, :total, :items, :last_transaction

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity =1)
    quantity.times{@items << title}
    @total += (price * quantity)
    self.last_transaction = price * quantity
  end

  def apply_discount
    if @discount > 0
      @total -= ((@discount.to_f/100.0) * @total).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -=  self.last_transaction
  end
end
