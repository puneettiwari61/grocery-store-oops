require "terminal-table"

require_relative './cart'
require_relative './invoice'

class PriceCalculator 

    attr_reader :items

    def initialize
        @cart = Cart.new.items_bought_list
        @items_list = []
        @total_sale_price = 0
        @total_actual_price = 0
        calculate_price
        get_invoice
    end


    def calculate_price
       @cart.each do |item|
            quantity = item.quantity
            name = item.name
            sale_price = item.sale_price
           @total_sale_price +=  sale_price.round(2)
           @items_list << [name, quantity, "$#{sale_price}"]
           @total_actual_price += item.actual_price.round(2)
        end
    end

    def get_invoice 
        Invoice.new(@items_list).print_invoice(@total_actual_price, @total_sale_price)
    end
  
end


