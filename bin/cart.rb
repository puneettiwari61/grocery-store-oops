require("./item")

class Cart 

    attr_reader :items , :items_bought_list

    def initialize
        puts "Please enter all the items purchased separated by a comma"
        @items = gets.chomp.delete(' ').split(',')
        @items_bought_list = []
        create_item
    end

 
    def create_item
        @items_bought_list = @items.uniq.map do |item|
            quantity = @items.count(item)
            item = item.capitalize
            Item.new(item, quantity)
        end
    end



end

# puts Cart.new