class Customer < ApplicationRecord
    #  validates :stripe_id, presence: true
    has_many :orders
    after_create :create_on_stripe
    def create_on_stripe
        debugger
      params = { email: email, name: name }
      response = Stripe::Customer.create(params)
      self.stripe_id = response.id
      save
    end
end
