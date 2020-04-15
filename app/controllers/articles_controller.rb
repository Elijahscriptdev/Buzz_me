class ArticlesController < ApplicationController
  # before_action :require_user
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles
  # GET /articles.json
  def index
    @categories = Category.all
    cate = params[:cate]
    @articles = if !cate.nil?
                  Article.where(category_id: cate).ordered_by_most_recent
                else
                  Article.all.ordered_by_most_recent
                end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @categories = Category.all
    @most_popular = Article.most_popular
  end

  # GET /articles/new
  def new
    @categories = Category.all
    @article = current_user.author_articles.build
  end

  # GET /articles/1/edit
  def edit
    @categories = Category.all
  end

  # POST /articles
  # POST /articles.json
  def create
    @categories = Category.all
    @article = current_user.author_articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @article = Article.find_by(id: params[:id])
    
    if current_user.upvoted?(@article)
      current_user.remove_vote(@article)
    elsif current_user.downvoted?(@article)
      current_user.remove_vote(@article)
      current_user.upvote(@article)
    else
      current_user.upvote(@article)
    end
      redirect_to @article
  end

  def downvote
    @article = Article.find_by(id: params[:id])

    if current_user.downvoted?(@article)
      current_user.remove_vote(@article)
    elsif current_user.upvoted?(@article)
      current_user.remove_vote(@article)
      current_user.downvote(@article)
    else
      current_user.downvote(@article)
    end

    redirect_to @article
  end

  # def upvote
  #   article = Article.find(params[:id])
  #   Vote.create!(article: article, user: current_user, is_upvote: true)
  # end

  # def downvote
  #   article = Article.find(params[:id])
  #   Vote.create!(article: article, user: current_user, is_upvote: true)
  # end

  private 

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :description, :image, :category_id)
  end
end
