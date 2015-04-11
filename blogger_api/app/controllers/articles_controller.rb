class ArticlesController < ApplicationController
  respond_to :html, :json, :xml

  def show
    @article = Article.find(params[:id]).decorate
    # @comment = @article.comments.new
    respond_with(@article)
  end

  def index
    @articles, @tag = Article.search_by_tag_name(params[:tag])
    respond_with(@articles)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    flash[:notice] = @article.save ? "Your article was created." : "Article failed to save."
    respond_with @article, location: articles_path
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    flash[:notice] = @article.update_attributes(params[:article]) ? "Article was updated." : "Article failed to update."
    respond_with @article
  end

  def destroy
    article = Article.find params[:id]
    article.destroy
    flash[:notice] = "#{article} was destroyed."
    respond_with @article, location: articles_path
  end
end
