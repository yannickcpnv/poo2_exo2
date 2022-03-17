class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :product
  has_many :order_items
  has_many :orders, through: :order_items

  scope :cheap, -> { where('price <= 0.20') }
end
