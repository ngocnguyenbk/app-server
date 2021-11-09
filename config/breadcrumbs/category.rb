crumb :categories do
  link t(".category"), admin_categories_path
end

crumb :category do |category|
  link category.name, edit_admin_category_path(category)
  parent :categories
end

crumb :category_new do
  link t(".new")
  parent :categories
end
