class Registration < ApplicationRecord
  validates :school_district_name, presence: true
  validates :street_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
end
