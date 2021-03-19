class BookLog < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true, length: { maximum: 50 }
  validates :status, presence: true, inclusion: { in: %w(unread reading read) }
  validates :score, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
  validates :summary, presence: true, length: { maximum: 1000 }
end
