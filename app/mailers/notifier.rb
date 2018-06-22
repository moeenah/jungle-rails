class Notifier < ApplicationMailer
 def order_receipt(user_info, product_list, order_info)
    @user = user_info
    @list = product_list
    @order = order_info
    mail(to: user_info.email,
         subject: 'Jungle Order Receipt', from: 'no-reply@jungle.com')
  end
end