class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :variant

  validates :quantity, :unit_price, presence: true
end
