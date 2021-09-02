class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :order

  after_create :welcome_send
  after_create :create_user_cart

  def create_user_cart
    Cart.create(user_id: id)
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
