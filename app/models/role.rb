class Role < ApplicationRecord
    # Associations
    has_many :user_roles, dependent: :destroy
    has_many :users, through: :user_roles

    # Validations
    validates :name, presence: true, uniqueness: true
end
