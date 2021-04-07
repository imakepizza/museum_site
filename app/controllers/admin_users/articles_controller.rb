module AdminUsers
  class ArticlesController < AdminUsersController
    before_action :set_article, only: [ :edit, :update, :destroy]

    # GET /articles
    def index
      @articles = current_admin_user.articles
    end

    # GET /articles/1


    # GET /articles/new
    def new
      @article = current_admin_user.articles.build
    end

    # GET /articles/1/edit
    def edit
      @paragraph = @article.elements.build(element_type: 'paragraph')
    end

    # POST /articles
    def create
      @article = current_admin_user.articles.build(article_params)

      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /articles/1
    def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /articles/1
    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = current_admin_user.articles.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def article_params
        params.require(:article).permit(:title, :content)
      end
  end
end
