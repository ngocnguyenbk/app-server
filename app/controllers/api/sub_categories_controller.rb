module Api
  class SubCategoriesController < ApplicationController
    def index
      render json: category.sub_categories.as_json(only: [:id, :name]), status: :ok
    end

    private

    def category
      Category.find(params[:category_id])
    end
  end
end
