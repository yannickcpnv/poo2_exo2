class Client < ActiveRecord::Base
  has_many :orders
  has_many :ordered_products, through: :orders, :source => :products
  validates :firstname, presence: true
  validates :lastname, presence: true, length: { minimum: 5 }

  def to_s
    "#{firstname} #{lastname}"
  end
end
