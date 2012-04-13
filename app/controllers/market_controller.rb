class MarketController < ApplicationController
  def index
    increment_counter
    @patterns = Pattern.all
  end
end
