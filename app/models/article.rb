class Article < ApplicationRecord
  extend FriendlyId
  prepend GenerateSlug

  LIMIT_NEWS = 10
  SUB_TOP = 3
  LIMIT_RANDOM = 5
  LIMIT_LIST_ONE = 6

  belongs_to :sub_category
  belongs_to :topic, optional: true
  belongs_to :author

  has_many_attached :thumbnails do |attachable|
    attachable.variant :thumb, resize: "500x300"
  end

  scope :newest, -> { order(published_at: :desc) }

  friendly_id :title, use: :slugged
  alias_attribute :name, :title

  enum status: { draft: 0, published: 1, canceled: 2 }

  delegate :id, :full_name, to: :author, prefix: true, allow_nil: true
  delegate :id, :name, :category_name, to: :sub_category, prefix: true, allow_nil: true
  delegate :id, :name, to: :topic, prefix: true, allow_nil: true

  alias category_name sub_category_category_name

  ransacker :status, formatter: proc { |v| statuses[v] } do |parent|
    parent.table[:status]
  end
end
