class RemovePlanPriceAndStripSubToken < ActiveRecord::Migration[5.0]
  def change
    remove_column :school_registrations, :plan
    remove_column :school_registrations, :price
    remove_column :school_registrations, :stripe_subscription_token
  end
end
