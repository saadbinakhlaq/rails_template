class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :street, :city, :postal_code, :country, presence: true, length: { maximum: 200 }
end
