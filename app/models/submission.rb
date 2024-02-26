class Submission < ApplicationRecord
  # association
  belongs_to :goal
  belongs_to :user

  #validations:
  validates :date, presence: true
end
