require 'pry'

class CashRegister

  attr_accessor :discount, :total, :last_transaction
  attr_reader :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, qty = 1)
    self.last_transaction = Transaction.new(title, price, qty)
    self.total += self.last_transaction.qty * self.last_transaction.price
    self.last_transaction.qty.times { self.items << self.last_transaction.title }
  end

  def void_last_transaction
    self.total -= self.last_transaction.qty * self.last_transaction.price
    self.last_transaction.qty.times { self.items.pop }
  end

  def apply_discount
    unless self.discount == nil
      self.total -= self.total * (self.discount/100.0)
      return "After the discount, the total comes to $#{self.total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

end

class Transaction

  attr_accessor :title, :price, :qty

  def initialize(title, price, qty = 1)
    @title = title
    @price = price
    @qty = qty
  end

end
