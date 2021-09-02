class AdminMailer < ApplicationMailer
  default from: 'rthp@fastmail.com'

  def order_admins_email(user, order)
    @user = user
    @order = order
    @admins = Admin.all
    @url = 'http://psspsspss.herokuapp.com'

    @admins.each do |admin|
      mail(to: admin.email, subject: "Commande ##{@order.id} sur psspsspss !")
    end
  end
end
