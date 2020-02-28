class Locker < ApplicationRecord

  belongs_to :user


  validates :address, presence: true
  validates :size, presence: true, inclusion: { in: ['S - W40 | H40 | 40cm','M - W70 | H40 | 70cm','L - W90 | H60 | 90cm'] }
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  def get_photo
    if size == 'S - W40 | H40 | 40cm'
      photo = "https://www.3dlockers.co.uk/_assets/img/site/products/large/3-door.jpg"
    elsif size == 'M - W70 | H40 | 70cm'
      photo = "https://www.3dlockers.co.uk/_assets/img/site/products/large/small-chemical-coshh-cabinet-900-x-460-x-460.jpg"
    else
      photo = "https://www.3dlockers.co.uk/_assets/img/site/products/large/1800high-security-cupboard.jpg"
    end
  end
end
