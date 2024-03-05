class SubmissionsController < ApplicationController
  def index
    @goal = Goal.find(params["goal_id"])
    @submissions = Submission.all
    @submission = @submissions.first
    # code from create

    # Its going to need the goal instance in order for it to submit for the correct goal
    # Find the id of the goal itself??? Can't be params[:id] cause its not exactly from a form. Its form a previous form
    # @submission.goal = Goal.new()
    # How is it going to know its the exact goal you're trying to submit??
    # need to give it a date from the goal itself
    # submission = Submission.new(params[:goal_id])
    # @date = Goal.find(params["goal_id"].date_id)
    # @goal = Goal.find(params["goal_id"])
    # submission.goal = @goal
    # submission.user = current_user
    # submission.save
    # raise
  end

  # Copy paste this and delete this before pushing (remember you're still on the created-submission-forms-branch)
  def create
    @submission = Submission.new(submission_params) # needs to be getting date through some params i think -> Ideally want it to be getting it through the seeded data. Submission.start_date????

    # uncomment here later
    @goal = Goal.find(params["goal_id"])
    @submission.goal = @goal
    @submission.user = current_user

    @coins = current_user.avatar.coins
    if @submission.achieved && @submission.save
      # where do I want to redirect to? home path??
      current_user.avatar.update(coins: @coins + 50)
      redirect_to root_path(goal: @submission.goal.name, achieved: @submission.achieved, expression_url: @submission.achieved ? @submission.goal.part_url : ""), notice: "Thank you"
      # but doesn't change anything
    else
      redirect_to root_path, notice: "Sorry we're having issues", status: :unprocessable_entity
      # render the form???
      # render "shelters/show", status: :unprocessable_entity
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:achieved, :date)
  end

  # def create
  #   @submissions = Submission.new(submission_params)
  #   @submissions.user = current_user
  #   @coins = current_user.avatar.coins
  #   if @submission.achieved && @submissions.save
  #     @coins += 50
  #     redirect_to home_path()
  #   else
  #     render :index, status: :unprocessable_entity
  #   end
  # end

  # private

  # def submission_params
  #   params.require(:submission).permit(:date, :achieved, :duration)
  # end
end
