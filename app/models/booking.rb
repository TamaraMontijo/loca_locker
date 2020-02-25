class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :locker
  validates :user, uniqueness: { scope: :locker }
end
