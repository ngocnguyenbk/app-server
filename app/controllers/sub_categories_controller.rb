class SubCategoriesController < ApplicationController
  before_action :category, :sub_category

  def show
    @package_name = "sub_categories/show"
    @q = category.sub_categories.ransack(params[:q])
  end

  private

  def category
    @category = Category.friendly.find(params[:category_id])
  end

  def sub_category
    @sub_category = category.sub_categories.friendly.find(params[:id])
  end
end
