class Answer < ApplicationRecord
  belongs_to :theme
  has_one :reply, dependent: :destroy
  validates :body, presence: true, length: { maximum: 1000 }
end
