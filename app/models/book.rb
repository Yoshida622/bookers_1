class Book < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true
  # validates :title, presence:true
  # validates :body, presence:true
end
