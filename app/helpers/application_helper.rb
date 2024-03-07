module ApplicationHelper
  def food_percentage_color_dark(date)
    if current_user.food_percentage_for(date) < 40
      "color: #FF6073;"
    elsif current_user.food_percentage_for(date) < 80
      "color: #EFB622"
    else
      "color: #008C9B"
    end
  end

  def sleep_percentage_color_dark(date)
    if current_user.sleep_percentage_for(date) < 40
      "color: #FF6073;"
    elsif current_user.sleep_percentage_for(date) < 80
      "color: #EFB622"
    else
      "color: #008C9B"
    end
  end

  def exercise_percentage_color_dark(date)
    if current_user.daily_exercise_percentage_for(date) < 40
      "color: #FF6073;"
    elsif current_user.daily_exercise_percentage_for(date) < 80
      "color: #EFB622"
    else
      "color: #008C9B"
    end
  end

  def exercise_daily_percentage_color(date)
    if current_user.daily_exercise_percentage_for(date) < 40
      "color: #FF6073;"
    elsif current_user.daily_exercise_percentage_for(date) < 80
      "color: #EFB622"
    else
      "color: #008C9B"
    end
  end

  def food_background_border_color(date)
    if current_user.food_percentage_for(date) < 40
      "background-color: #FFD2D8; border: 4px #FF6073 solid;"
    elsif current_user.food_percentage_for(date) < 80
      "background-color: #FDF5D0; border: 4px #F6DE68 solid;"
    else
      "background-color: #CFEDE9; border: 4px #008C9B solid;"
    end
  end

  def sleep_background_border_color(date)
    if current_user.sleep_percentage_for(date) < 40
      "background-color: #FFD2D8; border: 4px #FF6073 solid;"
    elsif current_user.sleep_percentage_for(date) < 80
      "background-color: #FDF5D0; border: 4px #F6DE68 solid;"
    else
      "background-color: #CFEDE9; border: 4px #008C9B solid;"
    end
  end

  def exercise_background_border_color(date)
    if current_user.daily_exercise_percentage_for(date) < 40
      "background-color: #FFD2D8; border: 4px #FF6073 solid;"
    elsif current_user.daily_exercise_percentage_for(date) < 80
      "background-color: #FDF5D0; border: 4px #F6DE68 solid;"
    else
      "background-color: #CFEDE9; border: 4px #008C9B solid;"
    end
  end


  # def exercise_icon_color(date)
  #   if @exercise_percentage < 40
  #     "color: #FF6073;"
  #   elsif @exercise_percentage < 80
  #     "color: #EFB622"
  #   else
  #     "color: #008C9B"
  #   end
  # end

  def food_background_color(date)
    if current_user.food_percentage_for(date) < 40
      "background-color: #FFB5BE;"
    elsif current_user.food_percentage_for(date) < 80
      "background-color: #F6DE68;"
    else
      "background-color: #A7E0DE;"
    end
  end

  def exercise_background_color(date)
    if current_user.weekly_exercise_percentage_for(date) < 40
      "background-color: #FFB5BE;"
    elsif current_user.weekly_exercise_percentage_for(date) < 80
      "background-color: #F6DE68;"
    else
      "background-color: #A7E0DE;"
    end
  end

  def sleep_background_color(date)
    if current_user.sleep_percentage_for(date) < 40
      "background-color: #FFB5BE;"
    elsif current_user.sleep_percentage_for(date) < 80
      "background-color: #F6DE68;"
    else
      "background-color: #A7E0DE;"
    end
  end

  def food_bar_color(date)
    if current_user.food_percentage_for(date) < 40
      "background-color: #FF6073;"
    elsif current_user.food_percentage_for(date) < 80
      "background-color: #EFB622;"
    else
      "background-color: #008C9B;"
    end
  end
end
