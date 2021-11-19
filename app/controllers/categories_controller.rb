class CategoriesController < ApplicationController
  before_action :category, only: [:show]

  def show
    @package_name = "categories/show"
    @q = category.articles.published.ransack(params[:q])
    @news_articles = articles.limit(Article::LIMIT_NEWS)
    @new_article = @news_articles.sample
    @sub_top_articles = @news_articles.sample(Article::SUB_TOP)
    @topics = category.topics.limit(Topic::LIMIT)
  end

  private

  def category
    @category ||= Category.friendly.find(params[:id])
  end

  def articles
    @q.result.newest.with_attached_thumbnails
  end
end
