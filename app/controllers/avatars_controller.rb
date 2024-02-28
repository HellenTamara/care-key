class AvatarsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  def edit
    # raise
    @user = current_user
    @categories = ["hair", "pants", "shirt", "skin_color", "shoes"]
    @parts = Part.all

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "form", locals: {category: params[:category], parts: @parts}, formats: [:html] }
    end
  end


  def update
    # @category = "#{strong_params.keys.first}_id"
    # @part = Part.find(strong_params.values.first)
    current_user.password = "123456"
    if current_user.update(strong_params)
      # redirect_to edit_avatar_path
    end
  end

  private
  def strong_params
    params.require(:user).permit(:name, :hair_id, :pants_id, :shirt_id, :skin_color_id, :shoes_id)
  end
end
