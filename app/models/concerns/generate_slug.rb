module GenerateSlug
  def should_generate_new_friendly_id?
    name_changed? || super
  end

  def normalize_friendly_id(value)
    value = NonAccentVietnamese.new(value).call
    value = value.parameterize
    value = value[0...friendly_id_config.slug_limit] if friendly_id_config.slug_limit
    value
  end
end
