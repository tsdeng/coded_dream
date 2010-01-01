class CommentsController < ApplicationController
  def create
    comment=Comment.new(params[:comment])
    if comment.save();
      render :partial=>"/comments/comment",:collection=>Article.find(comment.article_id).comments
    else
      render :text=>"failed"

    end

  end

end
