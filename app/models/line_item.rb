#---
# Excerpted from "Agile Web Development with Rails 6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails6 for more book information.
#---
class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  after_initialize :set_product_price
  
  
  def total_price
    product.price * quantity
    #lineitem.product_price * quantity
  end
  
  def set_product_price
    if product
      self.product_price ||= product.price
    end
  end
  
end