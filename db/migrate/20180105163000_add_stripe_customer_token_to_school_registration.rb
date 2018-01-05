class AddStripeCustomerTokenToSchoolRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :school_registrations, :stripe_customer_token, :string
  end
end
