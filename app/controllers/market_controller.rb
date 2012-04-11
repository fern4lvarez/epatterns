class MarketController < ApplicationController
  def index
    @patterns = Pattern.all
  end
end
