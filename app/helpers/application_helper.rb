module ApplicationHelper
  def calendar_food_color(date)
    if current_user.food_percentage_for(date) < 40
      "color: #FF6073;"
    elsif current_user.food_percentage_for(date)< 80
      "color: #EFB622"
    else
      "color: #008C9B"
    end
  end

  def calendar_sleep_color(date)
    if current_user.sleep_percentage_for(date) < 40
      "color: #FF6073;"
    elsif current_user.sleep_percentage_for(date)< 80
      "color: #EFB622"
    else
      "color: #008C9B"
    end
  end

  def calendar_exercise_color(date)
    if current_user.weekly_exercise_percentage_for(date) < 40
      "color: #FF6073;"
    elsif current_user.weekly_exercise_percentage_for(date) < 80
      "color: #EFB622"
    else
      "color: #008C9B"
    end
  end
end
