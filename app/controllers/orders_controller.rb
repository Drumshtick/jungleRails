class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
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
  end
  
  def create
    charge = perform_stripe_charge
    order  = create_order(charge)
    if order.valid?
      @ordered_items = enhanced_cart
      empty_cart!
      OrderReciept.thanks_for_shopping(order).deliver_now
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Jane Smith's Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end
