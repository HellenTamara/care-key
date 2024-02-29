class Submission < ApplicationRecord
  # association
  after_create :check_achieved

  belongs_to :goal
  belongs_to :user
  has_one :avatar, through: :user

  #validations:
  validates :date, presence: true

  def check_achieved
    achieved == false
  end
end

# status == pending?
# achieved == false

# def achieved?

# end
