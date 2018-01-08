class SchoolRegistration < ApplicationRecord
  validates :name_of_person_completing_form, presence: true
  validates :email, presence: true
  validates :role_in_school, presence: true
  validates :school_name, presence: true
  validates :grade_levels, presence: true
  validates :street_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  
  attr_accessor :stripeToken
  
  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(description: email, id: "reachme", source: stripeToken)
        # This will make a call to stripe server and charge their card then create subscription
        self.stripe_customer_token = customer.id
        # self means user here
        save!
        # This runs save on the spot and sends it to the database
    end
  end
end
