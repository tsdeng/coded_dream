class Article < ActiveRecord::Base
  has_many :comments,:foreign_key => "article_id"

  #---------set default value

  def state
    read_attribute(:state) or "deactive"
  end
end
