class ArticlesController < ApplicationController
  def new
    if /ZAP\/2.7/ =~ request.user_agent
      logger.info "not allowing scanner to post"
      render plain: "403 scanner not allowed to add data", status: 403
    else
      @article = Article.new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end

  def index
    @articles = Article.all
  end

  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
   
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end

