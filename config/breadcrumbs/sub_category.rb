crumb :sub_categories do |category|
  link t(".sub_category"), admin_category_sub_categories_path(category)
  parent :categories
end

crumb :sub_category do |category, sub_category|
  link sub_category.name
  parent :sub_categories, category
end

crumb :sub_category_new do |category|
  link t(".new")
  parent :sub_categories, category
end
