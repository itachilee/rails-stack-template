class Customer < ApplicationRecord
  validates :name, :address, :mobile, :idcard, presence: true
  scope :recent, -> { order('created_at DESC')}
  belongs_to :user
end
