class Avatar < ApplicationRecord
  belongs_to :user
  belongs_to :hair, class_name: "Part", optional: true
  belongs_to :shirt, class_name: "Part", optional: true
  belongs_to :shoes, class_name: "Part", optional: true
  belongs_to :pants, class_name: "Part", optional: true
  belongs_to :skin_color, class_name: "Part", optional: true
end
