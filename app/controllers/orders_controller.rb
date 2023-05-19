class OrdersController < ApplicationController
  def new
    @user = User.find(params[:id].to_i)
    @event = Event.find(params[:id].to_i)
    @amount = @event.price
    @stripe_amount = (@amount * 100).to_i
  end

  def create

      @user = User.find(params[:id].to_i)
      @event = Event.find(params[:id].to_i)
      @amount = @event.price
      # Before the rescue, at the beginning of the method
      @stripe_amount = (@amount * 100).to_i
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: "Achat d'un produit",
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
    # After the rescue, if the payment succeeded
  end
end
