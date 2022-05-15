class Performance < ApplicationRecord

  validates :name,            presence: true
  validates :theater,         presence: true
  validates :start_day,       presence: true
  validates :last_day,        presence: true
  validates :info,            presence: true
  validates :price,           presence: true, numericality: { only_integer: true }
  validates :image,           presence: true
  
  belongs_to :admin_user
end
