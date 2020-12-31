require "terminal-table"

require "./cart"

class PriceCalculator 

    attr_reader :items

    def initialize
        @cart = Cart.new.items_bought_list
        @itemsList = []
        @total_sale_price = 0
        @total_actual_price = 0
        calculate_price
        print_invoice
    end


    def calculate_price
       @cart.each do |item|
            quantity = item.quantity
            name = item.name
            sale_price = item.sale_price
           @total_sale_price +=  sale_price.round(2)
           @itemsList << [name, quantity, "$#{sale_price}"]
           @total_actual_price += item.actual_price.round(2)
        end
    end


    def print_invoice 
        savings = @total_actual_price - @total_sale_price
       puts print_table
       puts "\n\nTotal price : $#{@total_sale_price}", "You saved $#{savings.round(2)} today.\n\n"
    end

  

  def print_table
    table = Terminal::Table.new :headings => ["Item", "Quantity", "Price"], :rows => @itemsList
    table.style = {
      width: 45,
      border_x: "-",
      border_i: "",
      border_y: "",
      border_top: false,
      border_bottom: false,
      all_separators: false,
    }
    table
  end
    
end


user_bill = PriceCalculator.new
