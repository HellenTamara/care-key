class Part < ApplicationRecord
  has_one_attached :photo
  # has_one :avatar, foreign_key: "#{self.category}_id"
  has_one :avatar_as_hair, foreign_key: :hair_id
  has_one :avatar_as_shoes, foreign_key: :shoes_id
  has_one :avatar_as_pants, foreign_key: :pants_id
  has_one :avatar_as_shirt, foreign_key: :shirt_id
  has_one :avatar_as_skin_color, foreign_key: :skin_color_id
  has_one :avatar_as_expression, foreign_key: :expression_id
end
