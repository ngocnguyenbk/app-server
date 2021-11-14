module Api
  class CategoriesController < ApplicationController
    def index
      render json: Category.all.as_json(only: [:id, :name]), status: :ok
    end
  end
end
