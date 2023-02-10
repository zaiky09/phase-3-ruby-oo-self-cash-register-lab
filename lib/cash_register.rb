class CashRegister
    attr_reader :discount, :items
  
    def initialize(discount=nil)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = 0
    end
  
    def total=(amount)
      @total = amount
    end
  
    def total
      @total
    end
  
    def add_item(title, price, quantity=1)
      @total += price * quantity
      quantity.times { @items << title }
      @last_transaction = price * quantity
    end
  
    def apply_discount
      if @discount
        @total -= @total * @discount / 100
        "After the discount, the total comes to $#{@total.to_i}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      @total -= @last_transaction
      @last_transaction = 0
    end
  end
