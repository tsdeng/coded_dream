class CommentsController < ApplicationController
  def create
    comment=Comment.new(params[:comment])
    if comment.save();
      render :partial=>"/comments/comment",:collection=>Article.find(comment.article_id).comments
    else
      render :text=>"failed"

    end

  end

  def destroy
    Comment.find(params[:id]).destroy
    render :text=>"deleted!"
  end

  def list
    article_id=params[:id];
    render :partial=>"/comments/comment",:collection=>Article.find(article_id).comments
  end

end
