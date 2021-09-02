class UserMailer < ApplicationMailer
  default from: 'rthp@fastmail.com'

  def welcome_email(user)
    @user = user

    @url  = 'http://psspsspss.herokuapp.com'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def order_email(user, order)
    @user = user
    @order = order

    @order.order_items.each do |oi|
      attachments[oi.item.picture.blob.filename.to_s] = {
        mime_type: oi.item.picture.blob.content_type,
        content: oi.item.picture.blob.download
      }
    end

    @url = 'http://psspsspss.herokuapp.com'

    mail(to: @user.email, subject: "Commande ##{@order.id} sur psspsspss !")
  end

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
