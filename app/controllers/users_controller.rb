
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
      redirect_to :controller=>"console"
    end
  end

  def home
  
      if params[:username]
        @author=User.find_by_username(params[:username])

      elsif session[:user_id]
        @author=User.find(session[:user_id])
      else
        raise AuthorizationError.new("can't find author")
      end
      @articles=Article.paginate_by_author_id_and_state @author.id,"active",:page=>params[:page]||1,:per_page=>3,:order=>"created_at DESC"
    
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
      if user.save
        flash[:notice]="you can login with your password now"
        redirect_to :action=>"login"
      else
        flash[:notice]=user.errors.full_messages.map{|message| "<p>#{message}</p>"}.join
      end
    end
  end

  def logout
    session[:user_id]=nil
    redirect_to :controller=>:articles
  end

  private

 

end