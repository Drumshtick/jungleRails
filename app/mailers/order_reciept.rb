class OrderReciept < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_reciept.thanks_for_shopping.subject
  #
  def thanks_for_shopping
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
