class Reply < ApplicationRecord
  belongs_to :answer
  belongs_to :theme
  belongs_to :user
end
