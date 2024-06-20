class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy
  has_one :address, through: :profile
  has_one :account, dependent: :destroy

  after_create :create_account

  private

  def create_account
    self.create_account!
  end
end
