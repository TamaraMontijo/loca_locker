class Locker < ApplicationRecord

  belongs_to :user


  validates :address, presence: true
  validates :size, presence: true, inclusion: { in: ['S - W40xH40x40cm','M - W70xH40x70cm','L - W90xH60x90cm'] }
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  def get_photo
    if size == 'S - W40xH40x40cm'
      photo = "https://www.3dlockers.co.uk/_assets/img/site/products/large/3-door.jpg"
    elsif size == 'M - W70xH40x70cm'
      photo = "https://www.3dlockers.co.uk/_assets/img/site/products/large/small-chemical-coshh-cabinet-900-x-460-x-460.jpg"
    else
      photo = "https://www.3dlockers.co.uk/_assets/img/site/products/large/1800high-security-cupboard.jpg"
    end
  end
end
