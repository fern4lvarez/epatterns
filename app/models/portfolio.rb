class Portfolio < ActiveRecord::Base
  has_many :line_works, :dependent => :destroy
end
