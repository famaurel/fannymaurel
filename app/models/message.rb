class Message < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :content, presence: true
end
