class ConsoleController < ApplicationController
  before_filter :check_login,:remember_url
  def index
    @articles = Article.find_all_by_author_id(session[:user_id],:order=>"created_at DESC")    
  end

end
