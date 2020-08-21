class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer

  enum how_pay: { クレジットカード: 0, 銀行振込: 1 }
end
