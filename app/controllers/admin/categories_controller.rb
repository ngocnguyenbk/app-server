module Admin
  class CategoriesController < Admin::BaseController
    before_action :category, only: [:show, :edit, :update, :destroy]

    def index
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
        flash[:success] = t(".created")
        redirect_to admin_categories_path
      else
        flash[:danger] = t(".created_false")
        render :new
      end
    end

    def update
      @form = CategoryForm.new(@category, category_params)

      if @form.save
        flash[:success] = t(".updated")
        redirect_to admin_categories_path
      else
        flash[:danger] = t(".updated_false")
        render :new
      end
    end

    private

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
