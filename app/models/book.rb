class Book < ApplicationRecord
  self.table_name = "books"
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  has_one_attached :image
  belongs_to :user

end
