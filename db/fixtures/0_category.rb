categories = []

10.times do
  category = Category.new(name: Faker::Commerce.unique.department(max: 1),
                          description: Faker::Commerce.department(max: 1),
                          hex_code: Faker::Color.unique.hex_color)
  category.run_callbacks(:validation) { false }

  categories << category
end

Category.import categories
