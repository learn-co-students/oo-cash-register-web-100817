class CashRegister

	attr_accessor :total, :discount, :price , :item

	def initialize(discount = 0)
		@total = 0.0
		@discount = discount
		@cart = []
		@prices = {}
	end

	def add_item(item_name, price, quantity = 1)
		@price = price
		@item = item_name
		@total += price * quantity
		quantity.times { @cart << item_name }
		@prices[@item] = @price
	end


	def apply_discount
		if @discount > 0
			@total -= @total * @discount / 100
			return "After the discount, the total comes to $#{@total.to_i}." 
		else
			return "There is no discount to apply."
		end
	end

	def items
		return @cart
	end

	def void_last_transaction
		item_cost = @prices[@item]
		@total -= item_cost
	end

end

