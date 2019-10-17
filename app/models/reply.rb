class Reply < ApplicationRecord
  belongs_to :answer
  validates :answer_id, uniqueness: true
end