class AddTotPriceToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :tot_price, :integer
  end
end
