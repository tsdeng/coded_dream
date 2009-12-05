class UsersController < ApplicationController
  def login
    if request.post?
      username,password=params[:username],params[:password];
      current_user=User.login(username,password)
      if !current_user
        flash[:notice]="unmatched username and password"
        return
      end
        session[:user_id]=current_user.id
        redirect_to :controller=>"console" unless session[:url]
        redirect_to session[:url]
    
    end
  end


  def register
    if request.post?
      username,password=params[:user][:username],params[:user][:password];
      if User.find_by_username(username) 
        puts 
        redirect_to :back;
        flash[:notice]="user exists!"
        return
      end
      user=User.new(params[:user])
      user.save
      flash[:notice]="you can login with your password now"
      redirect_to :action=>"login"
    end
  end

  def logout
    session[:user_id]=nil
    redirect_to session[:url]
  end

  private


end

