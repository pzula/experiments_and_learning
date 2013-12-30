class CommentsController < ApplicationController
  respond_to :html, :json, :xml 
  def create
    article = Article.find(params[:comment][:article_id])
    comment = article.comments.create(params[:comment])
    flash[:notice] = "Your comment was added."
    respond_with comment, location: article_path(article)
  end
end
