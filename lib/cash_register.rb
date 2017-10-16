require 'pry'
class CashRegister
  attr_accessor :discount, :total,:item,:price
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @@items =[]
  end

  def total
    @total
  end

  def add_item(item,price,quantity =1)
    self.item = item
    self.total += price * quantity
    # binding.pry
    quantity.times{@@items << item}
  end

  def apply_discount
    if discount > 0
      self.total -= self.total * self.discount / 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @@items
  end

  def void_last_transaction
    # binding.pry
    @total = 0
  end

end
