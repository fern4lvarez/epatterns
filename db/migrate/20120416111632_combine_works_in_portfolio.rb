class CombineWorksInPortfolio < ActiveRecord::Migration
  def self.up
    # replace multiple works for a single pattern
    # in a portfolio with a single work
    Portfolio.all.each do |portfolio|
      # count the number of each pattern in the portfolio
      sums = portfolio.line_works.group(:pattern_id).sum(:quantity)
      
      sums.each do |pattern_id, quantity|
        if quantity > 1
          # remove individual works
          portfolio.line_works.where(:pattern_id=>pattern_id).delete_all
          
          # replace with a single work
          portfolio.line_works.create(:pattern_id=>pattern_id, :quantity=>quantity)
        end
      end
    end
  end
  
  def self.down
    #split works with quantity>1 into multiple works
    LineWork.where("quantity>1").each do |line_work|
      #add individual works
      line_work.quantity.times do
        LineWork.create :portfolio_id=>line_work.portfolio_id, :pattern_id=>line_work.pattern_id, :quantity=>1
      end
      # remove original work
      line_work.destroy
    end
  end
end
