class SubCategory < ApplicationRecord
  extend FriendlyId
  prepend GenerateSlug

  LIMIT = 5

  has_many :articles, dependent: :destroy

  belongs_to :category
  friendly_id :name, use: :slugged

  delegate :id, :name, to: :category, prefix: true, allow_nil: true
end
