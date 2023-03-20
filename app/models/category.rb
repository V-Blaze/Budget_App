class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
