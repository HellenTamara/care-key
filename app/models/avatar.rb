class Avatar < ApplicationRecord
  belongs_to :user
  has_one :hair, class_name: "Part", optional: true
  has_one :shirt, class_name: "Part", optional: true
  has_one :shoes, class_name: "Part", optional: true
  has_one :pants, class_name: "Part", optional: true
  has_one :skin_color, class_name: "Part", optional: true
end
