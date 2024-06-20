class Post < ApplicationRecord
  belongs_to :account
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { minimum: 5 }

  STATUSES = %w{ unpublished published deleted }

  STATUSES.each do |status|
    define_method("#{status}?") do
      self.status == status
    end

    define_method("#{status}!") do
      self.update_attribute(:status, status)
    end
  end

  resourcify
end
