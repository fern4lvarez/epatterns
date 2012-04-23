class LineWork < ActiveRecord::Base
  belongs_to :pattern
  belongs_to :portfolio
  
  def total_price
    pattern.price * quantity
  end
end
