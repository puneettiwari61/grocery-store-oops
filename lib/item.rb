
class Item

    attr_reader :name, :quantity

    def initialize(item, quantity)
        @name = item
        @quantity = quantity
    end

    def sale_price 
       get_sale_price(name,quantity)
    end

    def actual_price
        get_actual_price(name,quantity)
    end



 private
 def get_sale_price(name,quantity)
   case name
   when "Milk"
       if quantity%2 == 0 
           quantity/2 * 5.00
       else 
        (quantity-1)/2 * 5.00 + 3.97
       end

   when "Bread"
       if quantity%3 == 0
           quantity/3 * 6.00
       else
         (quantity -  (quantity/3) * 3) * 2.17 + (quantity/3 * 6)
       end
   when "Banana"
       0.99 * quantity
   when "Apple"
       0.89 * quantity
   else 
       0
   end
end

private
   def get_actual_price (name,quantity)
       case name
       when "Milk"
           quantity * 3.97

       when "Bread"
           quantity * 2.17

       when "Banana"
           quantity * 0.99 
           
       when "Apple"
           quantity * 0.89
       else 
           0
       end

end

end
