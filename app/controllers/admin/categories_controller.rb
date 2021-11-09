module Admin
  class CategoriesController < Admin::BaseController
    before_action :category, only: [:show, :edit, :update, :destroy]
    before_action :package_name, only: [:new, :edit, :create, :update]

    def index
      @package_name ||= "categories/index"
      @categories = Category.all
    end

    def show; end

    def new
      @category = Category.new
      @form = CategoryForm.new(@category)
    end

    def edit
      @form = CategoryForm.new(@category, sanitize_params)
    end

    def create
      @category = Category.new
      @form = CategoryForm.new(@category, category_params)

      if @form.save
        flash.now[:success] = t(".created")
        redirect_to admin_categories_path
      else
        flash.now[:danger] = t(".created_false")
        render :new
      end
    end

    def update
      @form = CategoryForm.new(@category, category_params)

      if @form.save
        flash.now[:success] = t(".updated")
        redirect_to admin_categories_path
      else
        flash.now[:danger] = t(".updated_false")
        render :new
      end
    end

    def destroy
      if category.destroy
        flash[:info] = t(".destroyed")
      else
        flash[:danger] = t(".destroyed_false")
      end

      head :ok
    end

    private

    def package_name
      @package_name ||= "categories/create"
    end

    def sanitize_params
      category.serializable_hash(only: CategoryForm::FORM_FIELDS).symbolize_keys
    end

    def category_params
      params.require(:category).permit(CategoryForm::FORM_FIELDS)
    end

    def category
      @category ||= Category.friendly.find(params[:id])
    end
  end
end
