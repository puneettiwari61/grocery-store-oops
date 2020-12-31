class Cart 

    attr_reader :items

    def initialize
        puts "Please enter all the items purchased separated by a comma"
        @items = gets.chomp.delete(' ').split(',')
        format_items
    end

    def format_items 
       @items = items.map {|x| x.capitalize}
    end
 

end

# puts Cart.new.format_items