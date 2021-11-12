class CategoryForm < BaseForm
  FORM_FIELDS = [:name, :hex_code, :description].freeze
  MODEL_NAME = "Category".freeze

  FORM_FIELDS.each do |f|
    attr_accessor f
  end

  validates :name, presence: true, length: { maximum: 100 }
  validates :name, uniqueness: { case_sensitive: true, model: Category }
  validates :hex_code, presence: true, length: { maximum: 100 }
  validates :hex_code, uniqueness: { case_sensitive: true, model: Category }
  validates :description, length: { maximum: 500 }

  attr_reader :category

  delegate :id, :persisted?, to: :category

  alias record category

  def self.name
    MODEL_NAME
  end

  def initialize(category, params = {})
    @category = category

    super params
  end

  def persist!
    category.update!(category_params)
  end

  private

  def category_params
    {
      name: name,
      hex_code: hex_code,
      description: description
    }
  end
end
