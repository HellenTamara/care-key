class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
  end

  def create
    @submissions = Submission.new(submission_params)
    @submissions.user = current_user
    @coins = current_user.avatar.coins
    if @submission.achieved && @submissions.save
      @coins += 50
      redirect_to home_path()
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:date, :achieved, :duration)
  end
end
