class Account < ApplicationRecord
  rolify
  belongs_to :user
  has_many :posts

  after_create :assign_role

  def assign_role
    self.add_role(:member) if self.roles.blank?
  end
end
