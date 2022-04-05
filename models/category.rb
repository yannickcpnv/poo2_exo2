class Category < ActiveRecord::Base
  has_many :products
  has_many :orders, -> { distinct }, through: :products

  validates :name, length: { minimum: 2, maximum: 50 }

  scope :not_ordered, -> { left_joins(:orders).where('category_id IS NULL') }
end
