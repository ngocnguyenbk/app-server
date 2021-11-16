authors = []

20.times do
  author = Author.new(full_name: Faker::Name.unique.name,
                      email: Faker::Internet.email,
                      nickname: Faker::Internet.unique.username,
                      profile: Faker::Job.title)
  author.run_callbacks(:validation) { false }

  authors << author
end

Author.import authors
