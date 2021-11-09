class SubCategory < ActiveRecord::Base
  extend FriendlyId
  prepend GenerateSlug

  belongs_to :category
  friendly_id :name, use: :slugged
end
