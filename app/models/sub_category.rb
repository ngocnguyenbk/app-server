class SubCategory < ApplicationRecord
  extend FriendlyId
  prepend GenerateSlug

  belongs_to :category
  friendly_id :name, use: :slugged

  delegate :id, :name, to: :category, prefix: true, allow_nil: true
end