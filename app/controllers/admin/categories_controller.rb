module Admin
  class CategoriesController < Admin::BaseController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    # GET /categories
    # GET /categories.json
    def index
      @categories = Category.all
    end

    # GET /categories/1
    # GET /categories/1.json
    def show
    end

    # GET /categories/new
    def new
      @category = Category.new
      @form = CategoryForm.new(@category)
    end

    # GET /categories/1/edit
    def edit
    end

    # POST /categories
    # POST /categories.json
    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to admin_categories_path, notice: 'Category was successfully created.' }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def category_params
      params.require(:category).permit(:name, :description)
    end
  end
end
