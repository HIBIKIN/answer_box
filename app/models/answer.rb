class Answer < ApplicationRecord
  belongs_to :theme
  validates :body, presence: true, length: { maximum: 1000 }
end
