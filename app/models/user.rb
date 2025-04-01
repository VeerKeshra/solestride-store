# app/models/user.rb
class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :orders, dependent: :destroy
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  # Role check
  def has_role?(role_name)
    roles.any? { |r| r.name == role_name.to_s }
  end
end
