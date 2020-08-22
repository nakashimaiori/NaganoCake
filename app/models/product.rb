class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  attachment :image

  with_options presence: true do
    validates :image
    validates :name, length: {minimum: 1}
    validates :detail
    validates :genre_id
    validates :before_price, numericality: true
  end

  validates :sale_status, inclusion: {in: [true, false]}


    def tax_price
      tax = 1.1
      tax_price = before_price * tax
      tax_price.round
    end

end
