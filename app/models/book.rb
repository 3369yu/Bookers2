class Book < ApplicationRecord
  validates :Title, presence: true
  validates :Opinion, presence: true
  
  has_one_attached :image
  belongs_to :user
end
