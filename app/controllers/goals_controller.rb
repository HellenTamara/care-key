class GoalsController < ApplicationController
  def index
    # @goals = current_user.goals
    @goal_sleep = current_user.current_sleep_goal
    @goal_exercise = current_user.current_exercise_goal
    @goal_eating = current_user.current_eating_goal
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to goals_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :start_date, :end_date, :frequency, :duration)
  end
end
