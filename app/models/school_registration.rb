class SchoolRegistration < ApplicationRecord
  validates :name_of_person_completing_form, presence: true
  validates :role_in_school, presence: true
  validates :school_name, presence: true
  validates :grade_levels, presence: true
  validates :street_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
end
