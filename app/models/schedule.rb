class Schedule < ApplicationRecord

  validates :performance_day,       presence: true
  validates :performance_time,      presence: true
  validates :stock,                 presence: true

  belongs_to :performance
end
