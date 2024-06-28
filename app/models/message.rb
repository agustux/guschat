class Message < ApplicationRecord
  validates :body, presence: true, length: { minimum: 1 }
end
