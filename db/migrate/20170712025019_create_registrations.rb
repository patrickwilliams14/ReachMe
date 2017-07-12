class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.string :school_district_name
      t.string :street_name
      t.string :city
      t.string :state
      t.string :zip_code
      t.timestamps
    end
  end
end
