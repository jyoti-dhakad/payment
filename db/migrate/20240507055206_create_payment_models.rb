class CreatePaymentModels < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_models do |t|
      t.references :order, null: false, foreign_key: true
      t.string :stripe_id

      t.timestamps
    end
  end
end
