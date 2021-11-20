class CategoriesController < ApplicationController
  before_action :category, only: [:show]

  def show
    @package_name = "categories/show"
    @q = category.articles.published.ransack(params[:q])
    @news_articles = articles.preload(:sub_category).limit(Article::LIMIT_NEWS)
    @new_article = @news_articles.sample
    @sub_top_articles = @news_articles.sample(Article::SUB_TOP)
    @topics = category.topics.limit(Topic::LIMIT)
    @random_articles = articles.sample(Article::LIMIT_RANDOM)
    @list_one_articles = articles.limit(Article::LIMIT_LIST_ONE).shuffle
    @sub_categories = category.sub_categories.limit(SubCategory::LIMIT)
                              .preload(articles: [thumbnails_attachments: [:blob]])
                              .shuffle
  end

  private

  def category
    @category ||= Category.friendly.find(params[:id])
  end

  def articles
    @q.result.newest.with_attached_thumbnails
  end
end
