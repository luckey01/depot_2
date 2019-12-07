#---
# Excerpted from "Agile Web Development with Rails 6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails6 for more book information.
#---
class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  
  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    
    if current_item
      
      if current_item.product_price.nil?        
        current_item.product_price = product.price
        current_item.quantity += 1
        
      elsif current_item.product_price != product.price
        
        current_item = line_items.build(product_id: product.id)
      
      else
        
        current_item.quantity += 1
      end
    else
      current_item = line_items.build(product_id: product.id)
      
    end     
    current_item
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
end
