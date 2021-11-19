class ArticleDecorator < Draper::Decorator
  delegate_all

  include Rails.application.routes.url_helpers
  include ActionView::Helpers::DateHelper

  def publication_date
    if object.published?
      object.published_at.strftime("%d/%m/%Y %T")
    else
      I18n.t("dictionary.not_published")
    end
  end

  def time_ago
    time_ago_in_words(object.published_at)
  end

  def title
    object.title.delete(".")
  end

  def thumb_url
    object.thumbnails.sample
  end

  def body_truncate
    object.body.truncate(200).html_safe # rubocop:disable Rails/OutputSafety
  end
end
