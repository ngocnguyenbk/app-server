module Api
  class AuthorsController < ApplicationController
    def index
      render json: Author.all.as_json(only: [:id, :full_name]), status: :ok
    end
  end
end
