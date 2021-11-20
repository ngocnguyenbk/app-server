module Admin
  class AuthorsController < Admin::BaseController
    before_action :author, only: [:edit, :update, :destroy]
    before_action :package_name, only: [:new, :edit, :create, :update]

    def index
      @package_name = "admin/authors/index"

      authors = Author.all
      @pagy, @authors = pagy(authors)
    end

    def new
      @author = Author.new
    end

    def create
      @author = Author.new(author_params)
      if @author.save
        flash[:success] = t("flash.created")
        redirect_to admin_authors_path
      else
        flash.now[:danger] = t("flash.created_false")
        render :new
      end
    end

    def edit; end

    def update
      if @author.update(author_params)
        flash[:success] = t("flash.updated")
        redirect_to admin_authors_path
      else
        flash.now[:danger] = t("flash.updated_false")
        render :edit
      end
    end

    def destroy
      if author.destroy
        flash[:info] = t("flash.destroyed")
      else
        flash[:danger] = t("flash.destroyed_false")
      end

      head :ok
    end

    private

    def package_name
      @package_name ||= "admin/authors/create"
    end

    def author_params
      params.require(:author).permit(:full_name, :email, :nickname, :profile)
    end

    def author
      @author ||= Author.friendly.find(params[:id])
    end
  end
end
