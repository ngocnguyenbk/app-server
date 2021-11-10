class SubCategoryForm < BaseForm
  FORM_FIELDS = [:name, :description].freeze
  MODEL_NAME = "SubCategory".freeze

  FORM_FIELDS.each do |f|
    attr_accessor f
  end

  validates :name, presence: true, length: { maximum: 100 }
  validates :name, uniqueness: { case_sensitive: true, model: SubCategory, scope: :category }
  validates :description, length: { maximum: 500 }

  attr_reader :sub_category, :category

  delegate :id, :persisted?, to: :sub_category

  alias record sub_category

  def self.name
    MODEL_NAME
  end

  def initialize(sub_category, category, params = {})
    @sub_category = sub_category
    @category = category

    super params
  end

  def persist!
    sub_category.update!(sub_category_params)
  end

  private

  def sub_category_params
    {
      name: name,
      category_id: category.id,
      description: description
    }
  end
end
