class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    
    def current_portfolio
      Portfolio.find(session[:portfolio_id])
    rescue ActiveRecord::RecordNotFound
      portfolio = Portfolio.create
      session[:portfolio_id] = portfolio.id
      portfolio
    end
    
  protected
  
    def increment_counter
      if session[:counter].nil?
        session[:counter] = 0
      else
        session[:counter] += 1
      end
    end
    
    def reset_counter
      session[:counter] = 0 unless session[:counter].nil?
    end
    
end
