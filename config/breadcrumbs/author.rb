crumb :authors do
  link t(".authors"), admin_authors_path
end

crumb :author do |author|
  link author.full_name, edit_admin_author_path(author)
  parent :authors
end

crumb :author_new do
  link t(".new")
  parent :authors
end
