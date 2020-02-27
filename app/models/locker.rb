class Locker < ApplicationRecord

  belongs_to :user


  validates :address, presence: true
  validates :size, presence: true, inclusion: { in: ['S','M','L'] }
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  def get_photo
    if size == 'S'
      photo = "https://www.3dlockers.co.uk/_assets/img/site/products/large/1000-high-security-cupboard.jpg"
    elsif size == 'M'
      photo = "https://www.3dlockers.co.uk/_assets/img/site/products/large/small-chemical-coshh-cabinet-900-x-460-x-460.jpg"
    else
      photo = "https://www.3dlockers.co.uk/_assets/img/site/products/large/1800high-security-cupboard.jpg"
    end
  end
end
