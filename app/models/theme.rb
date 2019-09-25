class Theme < ApplicationRecord
  has_many :answer, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { maximum: 85 }
  validates :user_id, presence: true
end