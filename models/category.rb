class Category < ActiveRecord::Base
  has_many :products
  has_many :orders, -> { distinct }, through: :products

  scope :not_ordered, -> { left_joins(:orders).where('category_id IS NULL') }
end
