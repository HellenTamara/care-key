class GoalsController < ApplicationController
  def index
    # @goals = current_user.goals
    @goal = Goal.new
    @goal_sleep = current_user.current_sleep_goal
    @goal_exercise = current_user.current_exercise_goal
    @goal_eating = current_user.current_eating_goal
  end

  def new
    @goal = Goal.new
    @goals = current_user.goals_of_the_week
    @submission = Submission.new
    # @main_goals = [current_user.current_eating_goal, current_user.current_exercise_goal, current_user.current_sleep_goal]
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @goal.start_date = Date.today
    @goal.end_date = Date.today + 6
    if @goal.save
      redirect_to new_goal_path
    else
      render :new, status: :unprocessable_entity
    end
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
    @hp_bar_level = current_user.avatar.hp_level
    @other_goals = Goal.all.where.not(name: "Food").where.not(name: "Sleep").where.not(name: "Exercise")
    @other_goals = @other_goals.where(user: current_user)
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :start_date, :end_date, :frequency, :duration)
  end
end
