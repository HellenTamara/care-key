class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @user = current_user

    @sleep_goal = @user.goals.where(name: "Sleep").last
    @food_goal = @user.goals.where(name: "Food").last
    @exercise_goal = @user.goals.where(name: "Exercise").last

    @sleep_frequency = @sleep_goal.frequency
    @food_frequency = @food_goal.frequency
    @exercise_frequency = @exercise_goal.frequency


    @sleep_achieved_amount = @sleep_goal.submissions.where(achieved: true)
    @food_achieved_amount = @food_goal.submissions.where(achieved: true)
    @exercise_achieved_amount = @exercise_goal.submissions.where(achieved: true)

    @sleep_percentage = (@sleep_achieved_amount.count * 100) / @sleep_frequency
    @food_percentage = (@food_achieved_amount.count * 100)  / @food_frequency
    @exercise_percentage = (@exercise_achieved_amount.count * 100)  / @exercise_frequency

    @hp_bar_level = (300 - @sleep_percentage - @food_percentage - @exercise_percentage) / 3
  end
end
