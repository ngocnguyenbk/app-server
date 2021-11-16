class ArticleDecorator < Draper::Decorator
  delegate_all

  include Rails.application.routes.url_helpers

  def publication_date
    if object.published?
      object.published_at.strftime("%d/%m/%Y %T")
    else
      I18n.t("dictionary.not_published")
    end
  end
end
