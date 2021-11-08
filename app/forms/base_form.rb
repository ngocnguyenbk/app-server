class BaseForm
  include ActiveModel::Model

  def save
    return false if invalid?

    persist!
    true
  rescue ActiveRecord::RecordInvalid => e
    e.record.errors
    false
  rescue StandardError => e
    errors.add(:base, e.message)
    false
  end

  private

  def persist!
    raise NotImplementedError
  end
end
