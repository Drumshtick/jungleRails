# Preview all emails at http://localhost:3000/rails/mailers/order_reciept
class OrderRecieptPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_reciept/thanks_for_shopping
  def thanks_for_shopping
    OrderReciept.thanks_for_shopping(Order.find_by(id: 22))
  end

end
