class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer


  validates :item_qty, presence: true
end