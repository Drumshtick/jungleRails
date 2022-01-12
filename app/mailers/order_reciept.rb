class OrderReciept < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_reciept.thanks_for_shopping.subject
  #

  # THIS IS FOR TEST AND DEVELOPMENT ONLY
    # REMOVE THIS LINE AFTER CHANGING TO PRODUCTION
    # OTHERWISE EMAILS WILL ALWAYS BE SAVED TO TMP
  ActionMailer::Base.delivery_method = :file


  def thanks_for_shopping(order)
    @order = order
    @orders = LineItem.where(order_id: @order.id)
    @ordered_items = []
    @cntr = 0
    @orders.each do |item|
      @ordered_items.push({
        product: Product.find(item.product_id),
        })
        item[:quantity] = item.quantity
      @ordered_items[@cntr][:amount_sold] = @orders[@cntr][:quantity]
      @cntr += 1
    end
    mail to: "#{@order.email}", subject: "Order number: #{@order.id}"
  end
end
