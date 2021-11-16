module Api
  class ThumbnailsController < ApplicationController
    def destroy
      if article.thumbnails.find(params[:id]).purge
        head :no_content
      else
        head :unprocessable_entity
      end
    end

    private

    def article
      Article.friendly.find(params[:article_id])
    end
  end
end
