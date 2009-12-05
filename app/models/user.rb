class User < ActiveRecord::Base
  def self.login(username,password)
    if username=="tsdeng" 
      return User.new(:id=>100) 
    end
  end 
end
