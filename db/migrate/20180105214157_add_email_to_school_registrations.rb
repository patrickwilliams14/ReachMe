class AddEmailToSchoolRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :school_registrations, :email, :string
  end
end
