require 'pry'

class CashRegister

  attr_accessor :discount, :total, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = Array.new
    @last_transaction = Hash.new
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      @items << title
    end
    self.last_transaction = {title: title, price: price, quantity: quantity}
  end

  def apply_discount
    if discount != 0
      self.total -= (self.total * self.discount / 100)
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_transaction[:quantity] * self.last_transaction[:price]
  end

end
