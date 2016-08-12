class Activity < ApplicationRecord
  # Relationships
  belongs_to :user

  # Validations
  validates  :name, presence: true, length: { minimum: 3, maximum: 140 }
  validates  :date, presence: true
  validate   :in_the_past?
  validates  :calories, presence: true,
                        numericality: { greater_than_or_equal_to: 1,
                                       less_than_or_equal_to: 5000 }
  # validates  :burnt, presence: true
  validates  :user, presence: true

  # Callbacks
  after_save :update_count

  def self.total_grouped_by_day(start)
    start = start.to_date
    activities = where(date: start..Date.today)
    activities = activities.group("date")
    activities = activities.select("date, sum(calories) as total_calories")
    activities.group_by { |a| a.date.to_date }
  end

  private

    def update_count
      user.update_attribute(:activity_count, user.activities.count)
    end

    def in_the_past?
      if date && date > Date.today
        errors.add(:date, " must be in the past")
      end
    end

end
