class User < ActiveRecord::Base
  has_many :articles,:foreign_key => :author_id
  def self.login(username,password)
    return self.find_by_username_and_password(username,password)
  end 
end
