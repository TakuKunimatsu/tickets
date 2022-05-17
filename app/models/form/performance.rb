class Form::Performance < Performance
  REGISTRABLE_ATTRIBUTES = %i(performance_day performance_time stock)
  attr_accessor :schedule
end