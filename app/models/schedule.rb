class Schedule < ApplicationRecord

  validates :performance_day,       presence: true
  validates :performance_time,      presence: true
  validates :stock,                 presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }

  belongs_to :performance
end
