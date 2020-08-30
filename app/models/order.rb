class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer


  validates :select_address, acceptance: true

  with_options presence: true do
    validates :receive_postal_code, format: {with: /\A\d{7}\z/}
    validates :receive_address
    validates :receive_name, length: {maximum: 20, minimum: 2}
    validates :total_amount
    validates :how_pay
    validates :postage
    validates :order_status
  end

  enum how_pay: {銀行振込: 0, クレジットカード: 1}
  enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4}

  #一回の注文に紐づく注文個数の合計をtotal_qtyに代入
  def total_qty
    total_qty = 0
    order_items.each do |order_item|
      total_qty += order_item.qty
    end
    total_qty
  end

  #商品合計金額の算出
  def total_price
    total_price = 0
    order_items.each do |order_item|
      total_price += order_item.subtotal
    end
    total_price
  end
end

