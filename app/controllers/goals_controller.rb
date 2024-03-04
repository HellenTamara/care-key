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
    @goal.assign_attributes(goal_params)
    @goal.frequency = goal_params[:frequency].to_i * 7 if @goal.name == "Food"

    if @goal.save
      redirect_to goals_path
      flash[:notice] = "Your new goal was saved!"
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
