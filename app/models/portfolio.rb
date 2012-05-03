class Portfolio < ActiveRecord::Base
  has_many :line_works, :dependent => :destroy
  
  def add_pattern(pattern_id)
    current_work = line_works.find_by_pattern_id(pattern_id)
    if current_work
      current_work.quantity += 1
    else
      current_work = line_works.build(:pattern_id => pattern_id)
      current_work.price = current_work.pattern.price
    end
    current_work
  end
  
  def total_price
    line_works.to_a.sum{ |work| work.total_price }
  end
end
