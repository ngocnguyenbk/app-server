crumb :sub_categories do |category|
  link t(".sub_category"), admin_category_sub_categories_path(category)
  parent :categories
end

# crumb :category do |category|
#   link category.name, edit_admin_category_path(category)
#   parent :categories
# end

# crumb :category_new do
#   link t(".new")
#   parent :categories
# end
