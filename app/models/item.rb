class Item < ApplicationRecord
  validates :title, presence: true
  # validates :description, presence: true
  validates :price, presence: true
  # validates :image_url, presence: true
  has_many :cart_items
  has_many :cart
  has_many :order_items
  has_many :order
  has_one_attached :picture
end
