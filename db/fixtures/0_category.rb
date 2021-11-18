categories = []

8.times do
  name = Faker::Commerce.unique.department(max: 1)
  category = Category.new(name: name,
                          description: name,
                          hex_code: Faker::Color.unique.hex_color)
  category.run_callbacks(:validation) { false }

  categories << category
end

Category.import categories
