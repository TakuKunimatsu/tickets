class Order < ApplicationRecord
  validates :buy_count,         presence: true

  belongs_to :performance
  belongs_to :schedule
  belongs_to :user
end
