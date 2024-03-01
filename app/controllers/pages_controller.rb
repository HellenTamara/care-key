class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    if user_signed_in?
      @user = current_user

    @goal_sleep = current_user.current_sleep_goal
    @goal_exercise = current_user.current_exercise_goal
    @goal_eating = current_user.current_eating_goal

    @sleep_frequency = @goal_sleep.frequency
    @food_frequency = @goal_eating.frequency
    @exercise_frequency = @goal_exercise.frequency


    @sleep_achieved_amount = @goal_sleep.submissions.where(achieved: true)
    @food_achieved_amount = @goal_eating.submissions.where(achieved: true)
    @exercise_achieved_amount = @goal_exercise.submissions.where(achieved: true)

    @sleep_percentage = (@sleep_achieved_amount.count * 100) / @sleep_frequency
    @food_percentage = (@food_achieved_amount.count * 100)  / @food_frequency
    @exercise_percentage = (@exercise_achieved_amount.count * 100)  / @exercise_frequency

    @hp_bar_level = (@sleep_percentage + @food_percentage + @exercise_percentage)
  end
  end
  # def landing
  # end
  end
end
