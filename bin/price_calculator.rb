require "terminal-table"

class PriceCalculator 

    attr_reader :items

    def initialize
        puts "Please enter all the items purchased separated by a comma"
        @items = gets.chomp.split(',')
        @itemHash = []
        @total_sale_price = 0
        @total_actual_price = 0
        organize_items_with_quantity_and_price
        print_invoice
    end


    def get_items_array
        items.map do |item|
         item.delete(" ").capitalize
        end
    end

    def organize_items_with_quantity_and_price
        get_items_array.uniq.each do |item|
            quantity = get_items_array.count(item)
            sale_price = get_sale_price(item,quantity)
           @total_sale_price +=  sale_price.round(2)
           @itemHash << [item, quantity, "$#{sale_price}"]
          
           @total_actual_price += get_actual_price(item,quantity).round(2)
        end
    end


    def print_invoice 
        savings = @total_actual_price - @total_sale_price
       puts print_table
       puts "\n\nTotal price : $#{@total_sale_price}", "You saved $#{savings.round(2)} today.\n\n"
    end

  



  def print_table
    table = Terminal::Table.new :headings => ["Item", "Quantity", "Price"], :rows => @itemHash
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

  def total_price
    quantity = get_items_array.count(item)
    get_sale_price(item, quantity).round(2)
  end


  def get_price (item)
    quantity = get_items_array.count(item)
    get_sale_price(item, quantity).round(2)
  end




  def get_sale_price(x,y) 
    case x
    when "Milk"
        if y%2 == 0 
            y/2 * 5.00
        else 
         (y-1)/2 * 5.00 + 3.97
        end

    when "Bread"
        if y%3 == 0
           y/3 * 6.00
        else
          (y -  (y/3) * 3) * 2.17 + (y/3 * 6)
        end
    when "Banana"
        0.99 * y
    when "Apple"
        0.89 * y
    else 
        0
    end
end


def get_actual_price (x,y)

    case x
    when "Milk"
        y * 3.97

    when "Bread"
        y * 2.17

    when "Banana"
        y * 0.99 
        
    when "Apple"
        y * 0.89
    else 
        0
    end

end

    
end


user_bill = PriceCalculator.new