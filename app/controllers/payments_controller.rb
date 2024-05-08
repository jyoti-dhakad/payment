class PaymentsController < ApplicationController
  

  def create
    order = Order.find_by(id: params[:payment][:order_id])
    
    customer = order.customer
    @payment = PaymentModel.new(payment_params)
    @payment.stripe_id = customer.stripe_id
    if @payment.save
      render json: @payment, status: :created
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end
  
  private
  
  def payment_params
    params.require(:payment).permit(:order_id)
  end
end
