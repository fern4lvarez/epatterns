class LineWork < ActiveRecord::Base
  belongs_to :pattern
  belongs_to :portfolio
end
