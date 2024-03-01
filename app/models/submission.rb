class Submission < ApplicationRecord
  # before_create :check_achieved
  # association
  belongs_to :goal
  belongs_to :user
  has_one :avatar, through: :user

  #validations:
  validates :date, presence: true

  # private
  # def check_achieved
  #   :achieved == false
  # end
end
