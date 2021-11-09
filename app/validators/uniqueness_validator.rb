class UniquenessValidator < ActiveRecord::Validations::UniquenessValidator
  def initialize(klass)
    super
    @klass = options[:model] if options[:model]
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/GuardClause, Metrics/AbcSize
  def validate_each(record, attribute, value)
    if !options[:model] && record.class.ancestors.exclude?(ActiveRecord::Base)
      raise ArgumentError, "Unknown validator: 'UniquenessValidator'"
    elsif !options[:model]
      super
    else
      record_org = record
      attribute_org = attribute
      attribute = options[:attribute].to_sym if options[:attribute]
      record = if record_org.persisted?
                 record_org.record
               else
                 options[:model].new
               end
      record.assign_attributes(attribute => value)
      add_scope(record, record_org) if options[:scope].present?
      super
      if record.errors[attribute].any?
        record_org.errors.add(attribute_org, :taken,
                              **options.except(:case_sensitive, :scope).merge(value: value))
      end
    end
  end

  private

  def add_scope(record, record_org)
    Array(options[:scope]).each do |scope_item|
      scope_value = record_org.public_send(scope_item)
      record.public_send("#{scope_item}=", scope_value)
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/GuardClause, Metrics/AbcSize
end
