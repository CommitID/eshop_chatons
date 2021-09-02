class Item < ApplicationRecord
  validates :title, presence: true
  # validates :description, presence: true
  validates :price, presence: true
  validates :title, uniqueness: true if Rails.env.production?
  has_many :cart_items
  has_many :cart
  has_many :order_items
  has_many :order
  has_one_attached :picture
  validate :picture_validation

  def picture_validation
    errors[:base] << 'Veuillez associer une image au produit' unless picture.attached?
  end
end
