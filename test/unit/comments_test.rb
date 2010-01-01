require 'test_helper'

class CommentsTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should_build_a_comment_belongs_to_a_article" do
       articleOne=articles(:one)
       commentBelongsToArticleOne=articleOne.comments.build(:title=>"c1",:content=>"c2");
       assert_equal commentBelongsToArticleOne.article_id, articleOne.id, "comment.article_id=#{commentBelongsToArticleOne.article_id} but article.id=#{articleOne.id}"
  end
end
