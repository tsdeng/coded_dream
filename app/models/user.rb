class User < ActiveRecord::Base
  has_many :articles,:foreign_key => :author_id
  def self.login(username,password)
    return self.find_by_username_and_password(username,password)
  end
  validates_length_of :password, :within => 6..10
  validates_length_of :username, :within => 6..20
  validates_uniqueness_of :username
end
