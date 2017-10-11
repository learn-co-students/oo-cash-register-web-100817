class CashRegister

  attr_accessor :total
  attr_reader :discount


  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items_array = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    @item = title
    @item_price = price
    quantity.times do
      @items_array << title
    end
  end

  def apply_discount
    if @discount == 0
     return "There is no discount to apply."
    else
      @total_discount = @total * (@discount.to_f/100)
      total_charge = @total -= @total_discount
      return "After the discount, the total comes to $#{total_charge.round}."
    end
  end

  def items
    @items_array
  end

  def void_last_transaction
    @total -= @item_price
  end

end
