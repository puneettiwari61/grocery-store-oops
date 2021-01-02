require_relative "./item"
require_relative './invoice'

class Cart 

    attr_reader :items , :items_bought_list

    def initialize
        @items = ''
        @items_bought_list = []
        @total_sale_price = 0
        @total_actual_price = 0
        @items_list = []
    end

    def add_items_to_cart
        puts "Please enter all the items purchased separated by a comma"
        @items = gets.chomp.delete(' ').split(',')
        generate_items_bought_list
    end

 
    def generate_items_bought_list
        @items_bought_list = @items.uniq.map do |item|
            quantity = @items.count(item)
            item = item.capitalize
            Item.new(item, quantity)
        end
    end


    def calculate_price
        @items_bought_list.each do |item|
             quantity = item.quantity
             name = item.name
             sale_price = item.sale_price
            @total_sale_price +=  sale_price.round(2)
            @total_actual_price += item.actual_price.round(2)
         end    
    end


     def get_items_list
        @items_bought_list.each do |item|
            quantity = item.quantity
            name = item.name
            sale_price = item.sale_price
           @items_list << [name, quantity, "$#{sale_price}"]
        end
        @items_list
    end


     def generate_invoice 
        invoice = Invoice.new(get_items_list)
        invoice.print_invoice(@total_actual_price, @total_sale_price)
     end
  

end

# puts Cart.news