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
    @goals = Goal.all.where.not(name: "Food").where.not(name: "Sleep").where.not(name: "Exercise")
    @submission = Submission.new
  end

  def create

    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @goal.start_date = Date.today
    @goal.end_date = Date.today + 6
    if @goal.save
      redirect_to new_goal_path
      flash[:notice] = "New task added!"
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
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :start_date, :end_date, :frequency, :duration)
  end
end
