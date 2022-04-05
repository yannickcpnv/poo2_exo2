class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :supplier
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :comments, as: :target

  scope :cheap, -> { where('price <= 0.20') }
end
