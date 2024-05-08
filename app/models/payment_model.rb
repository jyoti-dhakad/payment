class PaymentModel < ApplicationRecord
  attr_accessor :number, :exp_month, :exp_year, :cvc
  belongs_to :order
  after_create :create_on_stripe
  def create_on_stripe
    debugger
    token = get_token
    params = { amount: order.amount_cents, currency: 'usd', source: token}
    response = Stripe::Charge.create(params)
    self.stripe_id = response.id
    save
  end
  def get_token
      debugger  
    token = Stripe::Token.create({
      card: {
        number: "4242424242424242",
        exp_month: 5,
        exp_year: 2024,
        cvc: "123" 
      }
      
    })
  end
end
