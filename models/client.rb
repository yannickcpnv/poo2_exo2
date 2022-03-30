class Client < ActiveRecord::Base
  has_many :orders
  has_many :ordered_products, through: :orders, :source => :products
  has_many :comments, foreign_key: :author_id

  scope :inactive, -> { where.missing(:orders) }
end
