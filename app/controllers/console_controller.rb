class ConsoleController < ApplicationController
  before_filter :check_login,:remember_url
  def index
    @articles = Article.all
  end

end
