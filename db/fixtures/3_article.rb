authors = Author.all

SubCategory.all.each do |sub_category|
  articles = []

  rand(50..100).times do
    article = { title: Faker::Hipster.sentences.sample,
                sub_category_id: sub_category.id,
                author_id: authors.sample.id,
                addresses: Faker::Address.city,
                status: Article.statuses.keys.sample,
                body: Faker::Lorem.paragraph(sentence_count: rand(300..500)) }
    article[:published_at] = article[:status] == "published" ? Time.zone.now : nil
    article[:slug] = article[:title].parameterize
    articles << article
  end
  Article.import articles
end
