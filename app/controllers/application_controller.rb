class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_user!, :except => [:show,:index]

  def handle_exceptions(e)
   case e
   when ActiveRecord::RecordNotFound
   	not_found
   else
   	internal_error(e)
   end
  end

  def not_found
   render 'application/not_found',:status => 404
  end

  def internal_error(e)
    if Rails.env.production?
      render 'application/internal_error', :status => 500, :layout => false
    else
      raise
    end
  end
  
end
