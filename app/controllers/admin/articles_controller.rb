module Admin
  class ArticlesController < Admin::BaseController
    before_action :article, only: [:edit, :update, :destroy]
    before_action :package_name, only: [:new, :edit, :create, :update]

    def index
      @articles = Article.all
    end

    def new
      article = Article.new
      @form = ArticleForm.new(article)
    end

    def create
      article = Article.new
      @form = ArticleForm.new(article, article_params)

      if @form.save
        flash[:success] = t("flash.created")
        redirect_to admin_articles_path
      else
        flash.now[:danger] = t("flash.created_false")
        render :new
      end
    end

    def edit; end

    def update
      if @article.update(article_params)
        redirect_to admin_articles_path
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to admin_articles_path
    end

    private

    def package_name
      @package_name ||= "admin/articles/create"
    end

    def article_params
      params.require(:article).permit(ArticleForm::FORM_FIELDS)
    end

    def article
      @article ||= Article.friendly.find(params[:id])
    end
  end
end
