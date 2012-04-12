class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    
    def current_portfolio
      Portfolio.find(session[:portfolio_id])
    rescue ActiveRecord::RecordNotFound
      portfolio = Portfolio.create
      session[:portfolio] = portfolio.id
      portfolio
    end
end
