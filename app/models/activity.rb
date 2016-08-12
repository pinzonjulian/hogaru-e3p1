class Activity < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3, maximum: 140 }
  validates :date, presence: true
  validates :cal_burnt, presence: true,
                        numericality: { greater_than_or_equal_to: 0,
                                        less_than_or_equal_to: 5000 }
  validates :cal_intake, presence: true,
                         numericality: { greater_than_or_equal_to: 0,
                                         less_than_or_equal_to: 5000 }

  # TODO: before_save ===> Add 1 to activity_count
  after_save :update_count

  private

  def update_count
    user = User.find(user_id)
    user.update_attribute(:activity_count, Activity.where(user_id: 1).count)
  end

end
