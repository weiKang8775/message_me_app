class Message < ApplicationRecord
  validates :body, presence: true, length: { maximum: 200 }
  belongs_to :user
  scope :custom_display, -> { order(:created_at).last(20) }
end
