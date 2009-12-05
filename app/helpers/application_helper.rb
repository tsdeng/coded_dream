# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_when_login text,alternative,url
    if session[:user_id]
       return link_to text,url
    end
    return alternative
    #return ""
  end
end
