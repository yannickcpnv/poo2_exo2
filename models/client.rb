class Client < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders

  validates :firstname, presence: true
  validates :lastname, presence: true, length: { minimum: 5 }

  def to_s
    "#{firstname} #{lastname}"
  end
end
