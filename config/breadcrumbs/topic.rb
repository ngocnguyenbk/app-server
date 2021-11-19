crumb :topics do
  link t(".topics"), admin_topics_path
end

crumb :topic do |topic|
  link topic.name, edit_admin_topic_path(topic)
  parent :topics
end

crumb :topic_new do
  link t(".new")
  parent :topics
end
