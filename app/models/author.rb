class Author < ApplicationRecord
  extend FriendlyId
  prepend GenerateSlug

  has_many :articles, dependent: :destroy

  validates :full_name, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, if: :email?
  validates :email, uniqueness: true, if: :email?

  friendly_id :nickname, use: :slugged

  alias_attribute :name, :nickname
end
