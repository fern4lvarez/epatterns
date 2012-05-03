class AddPriceToLineWork < ActiveRecord::Migration
  def self.up
    add_column :line_works, :price, :decimal
    LineWork.all.each do |li|
      li.price = li.pattern.price
    end
  end
  
  def self.down
    remove_column :line_works, :price
  end
end
