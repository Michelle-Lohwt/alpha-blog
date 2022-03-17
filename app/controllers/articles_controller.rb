class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    # if this line is not present, the new.html.erb view will have error 
    # because @article is not exist in `<% if @article.errors.any? %>` before error exist
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # try `render plain: params` to check out the params in case your forget, and you will find the `:article` parameter
    # params require the parameter :article (get it from the form in new.html.erb) to present 
    # permits returns a copy of the parameters object with the specified keys (:title, :description)
    @article = Article.new(params.require(:article).permit(:title, :description))
    
    # can try use `render plain: @article` to see whether an object is created
    # can try use `render plain: @article.inspect` to see what has been filled up in the @article, in this case, it will be something like below if you fill up the title and description:
    #   // #<Article id: nil, title: "testing", description: "testing desc", created_at: nil, updated_at: nil>
    
    if @article.save
      flash[:notice] = "Article was created successfully."
      # an alternative is `redirect_to article_path(@article)`
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated succesfully."
      redirect_to @article
    else
      render 'edit'
    end
  end
end