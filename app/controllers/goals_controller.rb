class GoalsController < ApplicationController
  def index
    # @goals = current_user.goals
    @goal_sleep = current_user.current_sleep_goal
    @goal_exercise = current_user.current_exercise_goal
    @goal_eating = current_user.current_eating_goal
    @goal = Goal.new
  end

  def update
    # @goal_sleep = current_user.current_sleep_goal
    # @goal_exercise = current_user.current_exercise_goal
    # @goal_eating = current_user.current_eating_goal

    @goal = Goal.find(params[:id])


    if @goal.update(goal_params)
      redirect_to goals_path
      flash[:notice] = "Goal updated"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def dashboard
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :start_date, :end_date, :frequency, :duration)
  end
end
