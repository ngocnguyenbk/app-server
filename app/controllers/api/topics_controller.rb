module Api
  class TopicsController < ApplicationController
    def index
      render json: category.topics.as_json(only: [:id, :name]), status: :ok
    end

    private

    def category
      Category.find(params[:category_id])
    end
  end
end
