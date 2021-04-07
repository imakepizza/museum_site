module AdminUsers
  class ElementsController < AdminUsersController
    before_action :set_article
    before_action :set_element, only: [ :update, :destroy]

    # GET /elements

    # POST /elements
    def create
      @element = @article.elements.build(element_params)

      if @element.save
        redirect_to edit_article_path(@article)
      else
        redirect_to edit_article_path(@article), notice: @element.errors.full_messages.join(". ") << "."
      end
    end

    # PATCH/PUT /elements/1
    def update
       @element.update(element_params)
      redirect_to edit_article_path(@element.article)
    end

    # DELETE /elements/1
    def destroy
      @element.destroy
      redirect_to edit_article_path(@element.article)
    end

    private
    def set_article
      @article = current_admin_user.articles.find(params[:article_id])
    end
      # Use callbacks to share common setup or constraints between actions.
      def set_element
        @element = @article.elements.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def element_params
        params.require(:element).permit(:element_type, :content, :image)
      end
  end
end
