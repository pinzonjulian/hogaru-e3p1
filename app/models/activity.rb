class Activity < ApplicationRecord
  # belongs_to :user
  validates :name, presence: true, length: { minimum: 3, maximum: 140 }
  validates :date, presence: true
  validates :cal_burnt, presence: true,
                        numericality: { greater_than_or_equal_to: 0,
                                        less_than_or_equal_to: 5000 }
  validates :cal_intake, presence: true,
                         numericality: { greater_than_or_equal_to: 0,
                                         less_than_or_equal_to: 5000 }
end
