module Admin
  class SubCategoriesController < Admin::BaseController
    before_action :sub_category, only: [:edit, :update, :destroy]
    before_action :category, except: :sub_categories
    before_action :package_name, only: [:new, :edit, :create, :update]

    def index
      @package_name = "admin/sub_categories/index"
      @sub_categories = category.sub_categories
    end

    def show; end

    def new
      sub_category = category.sub_categories.new
      @form = SubCategoryForm.new(sub_category, category)
    end

    def edit
      @form = SubCategoryForm.new(sub_category, category, sanitize_params)
    end

    def create
      sub_category = category.sub_categories.new
      @form = SubCategoryForm.new(sub_category, category, sub_category_params)

      if @form.save
        flash[:success] = t(".created")
        redirect_to admin_category_sub_categories_path
      else
        flash.now[:danger] = t(".created_false")
        render :new
      end
    end

    def update
      @form = SubCategoryForm.new(sub_category, category, sub_category_params)

      if @form.save
        flash[:success] = t(".updated")
        redirect_to admin_category_sub_categories_path
      else
        flash.now[:danger] = t(".updated_false")
        render :edit
      end
    end

    def destroy
      if sub_category.destroy
        flash[:info] = t(".destroyed")
      else
        flash[:danger] = t(".destroyed_false")
      end

      head :ok
    end

    def sub_categories
      @package_name = "admin/sub_categories/index"
      @sub_categories = SubCategory.all.preload(:category)
    end

    private

    def package_name
      @package_name ||= "admin/sub_categories/create"
    end

    def category
      @category ||= Category.friendly.find(params[:category_id])
    end

    def sanitize_params
      sub_category.serializable_hash(only: SubCategoryForm::FORM_FIELDS).symbolize_keys
    end

    def sub_category_params
      params.require(:sub_category).permit(SubCategoryForm::FORM_FIELDS)
    end

    def sub_category
      @sub_category ||= category.sub_categories.friendly.find(params[:id])
    end
  end
end
