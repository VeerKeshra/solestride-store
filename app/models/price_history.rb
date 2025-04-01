class PriceHistory < ApplicationRecord
  belongs_to :product

  validates :price, :effective_from, presence: true
end
