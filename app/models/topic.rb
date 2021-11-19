class Topic < ApplicationRecord
  extend FriendlyId
  prepend GenerateSlug

  LIMIT = 10

  belongs_to :category
  has_many :articles

  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true

  friendly_id :name, use: :slugged
end
