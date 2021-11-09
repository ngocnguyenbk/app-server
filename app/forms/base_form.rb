class BaseForm
  include ActiveModel::Model

  def save
    return false if invalid?

    persist!
    true
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error(e.message)
    e.record.errors
    false
  rescue StandardError => e
    Rails.logger.error(e.message)
    errors.add(:base, e.message)
    false
  end

  private

  def persist!
    raise NotImplementedError
  end
end
