class Article < ActiveRecord::Base
  has_many :comments,:foreign_key => "article_id"
end
