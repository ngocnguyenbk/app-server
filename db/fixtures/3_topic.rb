topics = []

Category.all.each do |category|
  rand(2..4).times do
    name = Faker::JapaneseMedia::Naruto.unique.character
    topic = category.topics.new(name: name,
                                description: name)
    topic.run_callbacks(:validation) { false }

    topics << topic
  end
end

Topic.import topics
