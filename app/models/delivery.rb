class Delivery < ApplicationRecord
  belongs_to :customer

  def full_address
    self.postal_code + self.address + self.name
  end

  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/}
end
