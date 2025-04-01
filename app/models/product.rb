class Product < ApplicationRecord
  has_many :variants, dependent: :destroy
  has_many :price_histories, dependent: :destroy

  validates :name, :price, :category, presence: true
end
