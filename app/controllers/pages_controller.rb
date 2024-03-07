class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      @user = current_user

      @goal_sleep = current_user.current_sleep_goal
      @goal_exercise = current_user.current_exercise_goal
      @goal_eating = current_user.current_eating_goal

      @submission = Submission.new
      @submission_sleep = Submission.find_by(user: current_user, goal: @goal_sleep, date: Date.today)

      # If the submission sleep goal is nil, show the form to create one

      # Checking if we have submission for exercise submission today
      @submission_exercise = Submission.find_by(user: current_user, goal: @goal_exercise, date: Date.today)

      # All submissions for food today
      @submission_eating = Submission.where(user: current_user, goal: @goal_eating, date: Date.today)

      @sleep_frequency = @goal_sleep.frequency
      @food_frequency = @goal_eating.frequency
      @exercise_frequency = @goal_exercise.frequency

      date = Date.today

      @sleep_percentage_today = (@goal_sleep.submissions.where(["achieved = ? and date = ?", true, date]).count * 100) / (@sleep_frequency / 7) #this is based on daily goals
      @food_percentage_today = (@goal_eating.submissions.where(["achieved = ? and date = ?", true, date]).count * 100) / (@food_frequency / 7) #this is based on daily goals
      @exercise_percentage_today = (@goal_exercise.submissions.where(["achieved = ? and date = ?", true, date]).count * 100) / (@exercise_frequency / 3)

      @sleep_achieved_amount = @goal_sleep.submissions.where(achieved: true)
      @food_achieved_amount = @goal_eating.submissions.where(achieved: true)
      @exercise_achieved_amount = @goal_exercise.submissions.where(achieved: true)

      @sleep_percentage = (@sleep_achieved_amount.count * 100) / @sleep_frequency
      # sleep = 7 *100/ 7

      # How much we have achieved compared to ho

      @food_percentage = (@food_achieved_amount.count * 100) / @food_frequency
      @exercise_percentage = (@exercise_achieved_amount.count * 100) / @exercise_frequency
      # binding.irb
      # exercise = 3 *100 / 3 (total is 300/3 = 100)

      @exercise_display_percentage =(@exercise_achieved_amount.count * 100) / 3

      # @hp_bar_level = 100 - ((@sleep_percentage + @food_percentage + @exercise_percentage)/3) #this is based on the week goals

      @hp_bar_level = (@sleep_percentage + @food_percentage + @exercise_percentage)/3 #this is based on the week goals
      current_user.avatar.update(hp_level: @hp_bar_level)
    end
  end
  # def landing
  # end
end
