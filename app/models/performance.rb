class Performance < ApplicationRecord

  validates :name,            presence: true
  validates :theater,         presence: true
  validates :start_day,       presence: true
  validates :last_day,        presence: true
  validates :info,            presence: true
  validates :price,           presence: true, numericality: { only_integer: true }
  validates :image,           presence: true
  validate :date_before_start
  validate :date_before_last
  validate :start_last_check

  def date_before_start
    return if start_day.blank?
    errors.add(:start_day, "は今日以降のものを選択してください") if start_day < Date.today
  end

  def date_before_last
    return if last_day.blank? || start_day.blank?
    errors.add(:last_day, "は開始日以降のものを選択してください") if last_day < start_day
  end

  def start_end_check
    errors.add(:last_day, "の日付を正しく記入してください。") unless
    self.start_day < self.end_day
  end

  has_many :schedules
  belongs_to :admin_user
end
