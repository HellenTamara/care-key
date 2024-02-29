class AvatarsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  def edit
    @user = current_user
    @avatar = @user.avatar
    @categories = ["hair", "pants", "shirt", "skin_color", "shoes"]
    @parts = Part.all

    respond_to do |format|
      format.html
      format.text { render partial: "form", locals: {category: params[:category], parts: @parts}, formats: [:html] }
    end
  end


  def update
    # @category = "#{strong_params.keys.first}_id"
    # @part = Part.find(strong_params.values.firs
    @avatar = Avatar.find(params[:id])
    if @avatar.update(strong_params)
      redirect_to edit_avatar_path(@avatar)
    end
  end

  private
  def strong_params
    params.require(:avatar).permit(:name, :hair_id, :pants_id, :shirt_id, :skin_color_id, :shoes_id, :hp_level)
  end
end