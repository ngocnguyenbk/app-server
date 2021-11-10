class Category < ApplicationRecord
  extend FriendlyId
  prepend GenerateSlug

  has_many :sub_categories, dependent: :destroy
  friendly_id :name, use: :slugged
end
