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
    # @goals = Goal.all.where.not(name: "Food").where.not(name: "Sleep").where.not(name: "Exercise")
    @goals = current_user.goals_of_the_week

    # if Time.now.strftime("%I:%M:%S") == ("11:45:00" || "16:00:00")
    # linebot = LineService.new(ENV["LINE_ID"]
    # message_text = ""
    # linebot.send_message
    # end

    @coins = current_user.avatar.coins
    
    if @submission.save
      # where do I want to redirect to? home path??
      if @goal == "Food" && @submission.achieved || @goal == "Sleep" && @submission.achieved || @goal == "Exercise" && @submission.achieved
        current_user.avatar.update(coins: @coins + 50)
      elsif @submission.achieved
        current_user.avatar.update(coins: @coins + 20)
      end

      respond_to do |format|
        format.html {redirect_to root_path(goal: @submission.goal.name, achieved: @submission.achieved, expression_url: @submission.achieved ? @submission.goal.part_url : "")}

        format.text { render partial: "submissions/submission_task_form", locals: {goals: @goals, submission: Submission.new}, formats: [:html] }
      end

    else
      redirect_to root_path, notice: "Sorry we're having issues", status: :unprocessable_entity
      # render the form???
      # render "shelters/show", status: :unprocessable_entity
    end
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update(submission_params)
      # fire a line message IF @submission.reminder == true
      linebot = LineService.new(ENV["LINE_ID"])
      linebot.send_sticker
      linebot.send_alert
      # backgroundjob.set().perform_later
      redirect_to root_path(goal: @submission.goal.name, achieved: @submission.achieved, expression_url: @submission.achieved ? @submission.goal.part_url : ""), notice: "Alarm set"
    else
      redirect_to root_path, notice: "Sorry we're having issues", status: :unprocessable_entity
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:achieved, :date, :reminder)
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
