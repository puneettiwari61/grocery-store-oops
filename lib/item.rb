require_relative './item_price'

class Item

    attr_reader :name, :quantity

    def initialize(item, quantity)
        @name = item
        @quantity = quantity
    end

    def sale_price 
        ItemPrice.new(@name, @quantity).sale_price
    end

    def actual_price
        ItemPrice.new(@name, @quantity).actual_price
    end

end
