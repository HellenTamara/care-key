class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    if current_user
      current_user.hair = Part.where(category: "hair").first if current_user.hair.nil?
      current_user.shirt = Part.where(category: "shirt").first if current_user.shirt.nil?
      current_user.shoes = Part.where(category: "shoes").first if current_user.shoes.nil?
      current_user.skin_color = Part.where(category: "skin_color").first if current_user.skin_color.nil?
      current_user.pants = Part.where(category: "pants").first if current_user.pants.nil?
      current_user.save
    end
  end
end
