class Article < ApplicationRecord
  extend FriendlyId
  prepend GenerateSlug

  belongs_to :sub_category
  belongs_to :author

  has_many_attached :thumbnails do |attachable|
    attachable.variant :thumb, resize: "500x300"
  end

  friendly_id :title, use: :slugged
  alias_attribute :name, :title

  enum status: { draft: 0, published: 1, canceled: 2 }

  delegate :id, :full_name, to: :author, prefix: true, allow_nil: true
  delegate :id, :name, to: :sub_category, prefix: true, allow_nil: true

  ransacker :status, formatter: proc { |v| statuses[v] } do |parent|
    parent.table[:status]
  end
end
