# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require "exceptions/exceptions"
class ApplicationController < ActionController::Base
  include Exceptions
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  rescue_from RuntimeError, :with=>:handle_runtime_error

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected
  def check_login
    if !session[:user_id]
      puts "!!!!!!!!!!!!!!!!!!!!!!!not loged in"
      redirect_to :controller=>:users,:action=>:login
      return
    end
  end

  def remember_url
    session[:url]=request.url
  end

  def redirect_to_remembered_url
    if session[:url] 
      redirect_to session[:url]
    else
      redirect_to :back
    end
  end
  def handle_runtime_error(ex)
    flash[:notice]=ex.message.to_s
    redirect_to root_path
  end
end
