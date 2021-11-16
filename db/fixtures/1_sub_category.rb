sub_categories = []

Category.all.each do |category|
  rand(3..6).times do
    sub_category = category.sub_categories.new(name: Faker::Commerce.unique.department(max: 2),
                                               description: Faker::Commerce.department(max: 1),
                                               hex_code: Faker::Color.unique.hex_color)
    sub_category.run_callbacks(:validation) { false }

    sub_categories << sub_category
  end
end

SubCategory.import sub_categories
