class CategoryForm < BaseForm
  FORM_FIELDS = %i[name description].freeze
  MODEL_NAME = 'Category'

  FORM_FIELDS.each do |f|
    attr_accessor f
  end

  attr_reader :category

  delegate :id, :persisted?, to: :category

  def self.name
    MODEL_NAME
  end

  def initialize(category, params = {})
    @category = category

    super params
  end

  def persist!
    category.update!(attributes)
  end
end
