  require 'pry'
class CashRegister

  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item,price, quantity=1)
    @total += price * quantity
    quantity.times {|x| @items << item}
    @last_transation = [item , price, quantity]
  end

  def apply_discount
    @total  -= @total * @discount/100
    @discount > 0 ? "After the discount, the total comes to $#{total}." :"There is no discount to apply."
  end

  def void_last_transaction
    @items.pop(@last_transation[2])
    @total -= @last_transation[1]*@last_transation[2]
  end

end
