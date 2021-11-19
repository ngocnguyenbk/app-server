authors = Author.all
topics = Topic.all

SubCategory.all.each do |sub_category|
  articles = []

  rand(10..20).times do
    article = { title: Faker::Hipster.sentences.sample,
                sub_category_id: sub_category.id,
                author_id: authors.sample.id,
                topic_id: topics.sample.id,
                addresses: Faker::Address.city,
                status: Article.statuses.keys.sample,
                body: Faker::Lorem.paragraph(sentence_count: rand(300..500)) }
    article[:published_at] = article[:status] == "published" ? Time.zone.now : nil
    article[:slug] = article[:title].parameterize
    articles << article
  end
  Article.import articles
end

Rails.logger.debug "----------Attach thumbnails----------"
Article.all.each do |article|
  Dir.foreach("tmp/images") do |filename|
    next if [".", ".."].include?(filename)

    file = File.open(Rails.root.join("tmp/images/#{filename}"))

    article.thumbnails.attach(io: file,
                              filename: filename,
                              content_type: "image/jpg",
                              identify: false)
    file.close
  end
end
Rails.logger.debug "----------Attach thumbnails done----------"
