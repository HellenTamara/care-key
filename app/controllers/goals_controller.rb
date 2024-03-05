class GoalsController < ApplicationController
  def index
    # @goals = current_user.goals
    @goal = Goal.new
    @goal_sleep = current_user.current_sleep_goal
    @goal_exercise = current_user.current_exercise_goal
    @goal_eating = current_user.current_eating_goal
  end

  def update
    # @goal_sleep = current_user.current_sleep_goal
    # @goal_exercise = current_user.current_exercise_goal
    # @goal_eating = current_user.current_eating_goal

    @goal = Goal.find(params[:id])


    if @goal.update(goal_params)
      redirect_to goals_path
      flash[:notice] = "Your new goal was saved!"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def dashboard
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

    @sleep_percentage_today = current_user.sleep_percentage_for(Date.today)
    @food_percentage_today = current_user.food_percentage_for(Date.today)
    @exercise_percentage = current_user.weekly_exercise_percentage_for(Date.today)
    

    sleep_achieved_amount = @goal_sleep.submissions.where(achieved: true)
    food_achieved_amount = @goal_eating.submissions.where(achieved: true)
    sleep_percentage = (sleep_achieved_amount.count * 100) / @goal_sleep.frequency
    food_percentage = (food_achieved_amount.count * 100)  / @goal_eating.frequency

    @hp_bar_level = (sleep_percentage + food_percentage + @exercise_percentage) #this is based on the week goals
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :start_date, :end_date, :frequency, :duration)
  end
end
