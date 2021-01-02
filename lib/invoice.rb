class Invoice

    def initialize(items_list)
        @items_list = items_list
        puts print_table
    end


    def print_invoice (total_actual_price, total_sale_price)
        savings = total_actual_price - total_sale_price
        puts "\n\nTotal price : $#{total_sale_price}", "You saved $#{savings.round(2)} today.\n\n"
     end


    # def generate_total_actual_price (total_actual_price)
    #     @total_actual_price = total_actual_price
    # end

    # def generate_total_sale_price (total_sale_price)
    #   @total_sale_price = total_sale_price
    # end

    # def generate_savings
    #   @total_actual_price - @total_sale_price
    # end
   

    def print_table
        table = Terminal::Table.new :headings => ["Item", "Quantity", "Price"], :rows => @items_list
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

