crumb :articles do
  link t(".articles"), admin_articles_path
end

crumb :article do |article|
  link article.full_name, edit_admin_article_path(article)
  parent :articles
end

crumb :article_new do
  link t(".new")
  parent :articles
end
