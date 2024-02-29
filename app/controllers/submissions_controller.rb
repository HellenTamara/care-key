class SubmissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]
  # Delete this line later, before pushing
  def index
    # @user = current_user
    @goal = Goal.find(params["goal_id"])
    # @submission = Submission.new
    @submissions = Submission.all
    @submission = @submissions.first
    # Its going to need the goal instance in order for it to submit for the correct goal
    # Find the id of the goal itself??? Can't be params[:id] cause its not exactly from a form. Its form a previous form
    # @submission.goal = Goal.new()
    # How is it going to know its the exact goal you're trying to submit??
  end

  # Copy paste this and delete this before pushing (remember you're still on the created-submission-forms-branch)
  def create
    # needs the date
    # needs the instance of submission
    # needs goals instance too??
    # I need to get the date from???
    #chat gpt @goal = Goal.find(submission_params[:goal_id])
    raise

    submission = Submission.new(date: date) # needs to be getting date through some params i think -> Ideally want it to be getting it through the seeded data.

    # Need to assign avatar but not sure how its going to work? Is it through making sure the associations are in place in both the avatar model and the submission model?
    @goal = Goal.find(params["goal_id"])
    submission.goal= @goal
    submission.user= current_user
    if submission.save
      raise
      # where do I want to redirect to? home path??
      # redirect_to home_path(@home)
      console.log("This was successful")
    else
      raise
      console.log("It failed to submit")
      # render "shelters/show", status: :unprocessable_entity
      # Where do you want to render to if the submission fails?? Or do you just want to show a pop up saying submission failed??
      # render :new, status: :unprocessable_entity
    end
  end

  # Private probably not needed cause the form itself is only a button and they can't input anything into the button
end
