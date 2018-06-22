class Notifier < ApplicationMailer
 def order_receipt(user_info, list, order)
    @user = user_info
    @list = list
    @order = order
    mail(to: user_info.email,
         subject: 'Jungle Receipt', from: 'no-reply@jungle.com')
  end
end