module ActivitiesHelper

  def activities_chart_data(start = 30.days.ago)
    burnt_by_day = current_user.activities.where(burnt: true).total_grouped_by_day(start)
    eaten_by_day = current_user.activities.where(burnt: false).total_grouped_by_day(start)
    (start.to_date..Date.today).map do |date|
      {
        date: date,
        calorie_burn: burnt_by_day[date].try(:first).try(:total_calories) || 0,
        calorie_intake: eaten_by_day[date].try(:first).try(:total_calories) || 0
      }
    end
  end

end
