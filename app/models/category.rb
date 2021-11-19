class Category < ApplicationRecord
  extend FriendlyId
  prepend GenerateSlug

  has_many :topics, dependent: :destroy
  has_many :sub_categories, dependent: :destroy
  has_many :articles, through: :sub_categories

  friendly_id :name, use: :slugged
end
