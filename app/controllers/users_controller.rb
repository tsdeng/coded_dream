class UsersController < ApplicationController
  def login
    if request.post?
      username=params[:username];
      password=params[:password];
      if username=="tsdeng" then
        session[:status]="login"
        redirect_to :controller=>"articles",:action=>"index"
      end
    end
  end
end

