class Item < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 },
                    format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  validates :title, uniqueness: true if Rails.env.production?

  has_many :cart_items
  has_many :cart
  has_many :order_items
  has_many :order
  has_one_attached :picture
  validate :picture_validation if Rails.env.production?

  def picture_validation
    errors[:base] << 'Veuillez associer une image au produit' unless picture.attached?
  end
end
