class ArticleForm < BaseForm
  FORM_FIELDS = [:title, :category_id, :sub_category_id, :topic_id, :author_id,
                 :addresses, :status, :body, :thumbnails].freeze
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
  validates :body, presence: true
  validates :thumbnails, presence: true, unless: -> { persisted? }

  validate :content_type, if: -> { thumbnails.present? }
  validate :file_size, if: -> { thumbnails.present? }

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

    return true if thumbnails.blank?

    article.thumbnails.attach(thumbnails)
  end

  def category_options
    Category.all.map { |c| [c.name, c.id] }
  end

  def sub_category_options
    category.present? ? category.sub_categories.map { |c| [c.name, c.id] } : []
  end

  def topic_options
    category.present? ? category.topics.map { |c| [c.name, c.id] } : []
  end

  def author_options
    Author.all.map { |c| [c.full_name, c.id] }
  end

  private

  def article_params
    {
      title: title,
      sub_category_id: sub_category_id,
      topic_id: topic_id,
      author_id: author_id,
      addresses: addresses,
      status: status,
      published_at: status == "published" ? Time.zone.now : nil,
      body: body
    }
  end

  def category
    @category ||= Category.find_by(id: category_id)
  end

  def content_type
    thumbnails.each do |file|
      unless file.content_type.in?(%w[image/jpeg image/png image/jpg])
        errors.add(:thumbnails, :invalid_content_type)
        return false
      end
    end
  end

  def file_size
    return false if errors.added?(:thumbnails, :invalid_content_type)

    thumbnails.each do |file|
      if file.size > 5.megabytes
        errors.add(:thumbnails, :too_big_file, size: 5)
        return false
      end
    end
  end
end
