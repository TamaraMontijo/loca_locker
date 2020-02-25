class Locker < ApplicationRecord
  belongs_to :user

  validates :address, presence: true
  validates :size, presence: true, inclusion: { in: ['S','M','L'] }
  validates :price, presence: true
end
