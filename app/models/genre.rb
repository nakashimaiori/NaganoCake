class Genre < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: {maximum: 15}

  enum status: {"有効": true, "無効": false}
end
