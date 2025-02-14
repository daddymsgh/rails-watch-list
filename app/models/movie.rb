class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
  has_many :bookmarks, dependent: :restrict_with_error
  has_many :lists, through: :bookmarks
  validate :cannot_be_destroyed_if_has_bookmarks, on: :destroy
end
