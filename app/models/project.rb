class Project < ApplicationRecord
  has_many :feedbacks, dependent: :destroy

  has_many_attached :images, dependent: :destroy
end
