class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, presence: true, length: { maximum: 200 }
  validates :phone_number, presence: true, length: { maximum: 20 }

  has_one :address, as: :addressable

  accepts_nested_attributes_for :address
end
