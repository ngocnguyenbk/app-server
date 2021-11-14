class ArticleForm < BaseForm
  FORM_FIELDS = [:title, :category_id, :sub_category_id, :author_id,
                 :addresses, :status, :body].freeze
  MODEL_NAME = "Article".freeze

  FORM_FIELDS.each do |f|
    attr_accessor f
  end

  validates :title, presence: true, length: { maximum: 150 }
  validates :category_id, presence: true
  validates :sub_category_id, presence: true
  validates :author_id, presence: true
  validates :addresses, presence: true
  validates :status, presence: true
  validates :body, presence: true, length: { maximum: 5000 }

  attr_reader :article

  delegate :id, :persisted?, to: :article

  alias record article

  def self.name
    MODEL_NAME
  end

  def initialize(article, params = {})
    @article = article

    super params
  end

  def persist!
    article.update!(article_params)
  end

  def category_options
    Category.all.map { |c| [c.name, c.id] }
  end

  def sub_category_options
    category.present? ? category.sub_categories.map { |c| [c.name, c.id] } : []
  end

  def author_options
    Author.all.map { |c| [c.full_name, c.id] }
  end

  private

  def article_params
    {
      title: title,
      sub_category_id: sub_category_id,
      author_id: author_id,
      addresses: addresses,
      status: status,
      body: body
    }
  end

  def category
    @category ||= Category.find_by(id: category_id)
  end
end
