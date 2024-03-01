class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  # Added comment for pull request
  def home
    @user = current_user
    @goal_sleep = current_user.current_sleep_goal
    @goal_exercise = current_user.current_exercise_goal
    @goal_eating = current_user.current_eating_goal
    @submission = Submission.new
    # Checking if we have submission for sleep today
    @submission_sleep = Submission.find_by(user: current_user, goal: @goal_sleep, date: Date.today)

    # If the submission sleep goal is nil, show the form to create one

    # Checking if we have submission for exercise submission today
    @submission_exercise = Submission.find_by(user: current_user, goal: @goal_exercise, date: Date.today)

    # All submissions for food today
    @submission_eating = Submission.where(user: current_user, goal: @goal_eating, date: Date.today)
  end
end
