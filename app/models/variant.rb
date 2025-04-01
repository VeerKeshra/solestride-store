class Variant < ApplicationRecord
  belongs_to :product
  has_many :order_items, dependent: :destroy

  validates :size, presence: true
  validates :color, presence: true
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
