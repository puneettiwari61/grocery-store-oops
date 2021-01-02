require "terminal-table"

require_relative './cart'
require_relative './invoice'

class PriceCalculator 

    def initialize
        @cart = Cart.new
    end

    def buy_items
        @cart.add_items_to_cart
        @cart.calculate_price
        @cart.generate_invoice
    end


end


