class CategoriesController < ApplicationController
  before_action :category, only: [:show]

  def show
    @package_name = "categories/show"
    @q = category.sub_categories.ransack(params[:q])
    @sub_categories = @q.result
  end

  private

  def category
    @category ||= Category.friendly.find(params[:id])
  end
end
