class Part < ApplicationRecord
  has_many :users
  has_one_attached :photo
end
