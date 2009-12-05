class UsersController < ApplicationController
  def login
    if request.post?
      username,password=params[:username],[:password];
      current_user=User.login(username,password)
      if current_user  then
        session[:user_id]=100
        redirect_to :controller=>"console" unless session[:url]
        redirect_to session[:url]
      end
    end
  end
  
  
  def register
  end
  
  def logout
    session[:user_id]=nil
    redirect_to session[:url]
  end
  
  private
  
  
end

