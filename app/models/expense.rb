class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories


  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true, length: { maximum: 500 }
end
