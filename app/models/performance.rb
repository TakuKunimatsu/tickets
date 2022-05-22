class Performance < ApplicationRecord

  validates :name,            presence: true
  validates :theater,         presence: true
  validates :start_day,       presence: true
  validates :last_day,        presence: true
  validates :info,            presence: true
  validates :price,           presence: true, numericality: { only_integer: true }
  validates :image,          presence: true
  validate :date_before_start
  validate :date_before_last

  has_one_attached :image
  has_many :schedules
  belongs_to :admin_user

  def date_before_start
    return if start_day.blank?
    errors.add(:start_day, "は今日以降のものを選択してください") if start_day < Date.today
  end

  def date_before_last
    return if last_day.blank? || start_day.blank?
    errors.add(:last_day, "は開始日以降のものを選択してください") if last_day < start_day
  end

end
