class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :after_price, presence: true
  validates :qty, presence: true, length: {maximum: 100}

  enum made_status: {着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}

  #小計
  def subtotal
    after_price * qty
  end
end
