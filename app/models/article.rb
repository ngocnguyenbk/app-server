class Article < ApplicationRecord
  extend FriendlyId
  prepend GenerateSlug

  belongs_to :sub_category
  belongs_to :author

  friendly_id :title, use: :slugged
  alias_attribute :name, :title

  enum status: { draft: 0, published: 1, canceled: 2 }

  delegate :id, :name, to: :author, prefix: true, allow_nil: true
  delegate :id, :name, to: :sub_category, prefix: true, allow_nil: true
end
