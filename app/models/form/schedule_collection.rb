class Form::ScheduleCollection < Form::Base
  DEFAULT_ITEM_COUNT = 10
  attr_accessor :performances

  def initialize(attributes = {})
    super attributes
    self.performances = DEFAULT_ITEM_COUNT.times.map { Form::Performance.new } unless performances.present?
  end

  def performances_attributes=(attributes)
    self.performances = attributes.map do |_, performance_attributes|
      Form::Performance.new(performance_attributes).tap { |v| v.availability = false }
    end
  end

  def valid?
    valid_performances = target_performances.map(&:valid?).all?
    super && valid_performances
  end

  def save
    return false unless valid?
    Performance.transaction { target_performances.each(&:save!) }
    true
  end

  def target_performances
    self.performances.select { |v| value_to_boolean(v.register) }
  end
end