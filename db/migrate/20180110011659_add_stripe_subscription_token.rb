class AddStripeSubscriptionToken < ActiveRecord::Migration[5.0]
  def change
    add_column :school_registrations, :stripe_subscription_token, :string
  end
end
