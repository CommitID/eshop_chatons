class Item < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :image_url, presence: true
    has_many :carts
    has_many :orders
end
