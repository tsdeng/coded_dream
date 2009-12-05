class User < ActiveRecord::Base
  def self.login(username,password)
    return self.find_by_username_and_password(username,password)
  end 
end
