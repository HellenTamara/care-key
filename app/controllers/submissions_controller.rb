class SubmissionsController < ApplicationController
  def index
    # @user = current_user
    # @submission = Submission.new

    #code from index
    @goal = Goal.find(params["goal_id"])
    @submissions = Submission.all
    @submission = @submissions.first

    # Its going to need the goal instance in order for it to submit for the correct goal
    # Find the id of the goal itself??? Can't be params[:id] cause its not exactly from a form. Its form a previous form
    # @submission.goal = Goal.new()
    # How is it going to know its the exact goal you're trying to submit??
    # need to give it a date from the goal itself
  end

  def create
    submission = Submission.new(submission_params) # needs to be getting date through some params i think -> Ideally want it to be getting it through the seeded data. Submission.start_date????
    @goal = Goal.find(params["goal_id"])
    submission.goal= @goal
    submission.user = current_user
    if submission.save
      # where do I want to redirect to? home path??
      redirect_to home_path(), notice: "Well done!"
    else
      redirect_to home_path(), notice: "Sorry we're having issues"
    end
  end

  private
  def submission_params
    params.require(:submission).permit(:achieved, :date)
  end
end
