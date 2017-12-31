class CreateSchoolRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :school_registrations do |t|
      t.string :name_of_person_completing_form
      t.string :role_in_school
      t.string :school_name
      t.string :grade_levels
      t.string :street_name
      t.string :city
      t.string :state
      t.string :zip_code
      t.timestamps
    end
  end
end
